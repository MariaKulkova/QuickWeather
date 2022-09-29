//
//  NetworkingService.swift
//  QuickWeather
//
//  Created by Maru on 15.08.2022.
//

import Foundation

enum APIError: Error {
    case invalidRequestURL
    case genericError
    case missingData
}

protocol APIRequesting {
    func call<T: Request>(_ request: T) async throws -> T.Output
}

class APIService: APIRequesting {

    var session: URLSession = URLSession(
        configuration: .default,
        delegate: nil,
        delegateQueue: .main
    )

    func call<T: Request>(_ request: T) async throws -> T.Output {
        let urlRequest = try urlRequest(from: request)
        let (data, response) = try await session.data(for: urlRequest)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw APIError.genericError
        }

        return try request.decoder(data)
    }

    func urlRequest<T: Request>(from request: T) throws -> URLRequest {
        var url = URLComponents(string: request.endpoint)
        url?.queryItems = request.queryParameters.queryItems

        guard let currentURL = url?.url else {
            throw APIError.invalidRequestURL
        }

        var urlRequest = URLRequest(url: currentURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest = try request.encoder(request.parameters, urlRequest)

        return urlRequest
    }

}

extension Dictionary where Key == String, Value == String {

    var queryItems: [URLQueryItem]? {
        let destination: [URLQueryItem] = self
            .sorted { first, second in first.key < second.key }
            .map { URLQueryItem(name: $0.key, value: $0.value) }

        return destination.isEmpty ? nil : destination
    }

}
