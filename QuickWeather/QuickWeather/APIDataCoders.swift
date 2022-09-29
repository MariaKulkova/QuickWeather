//
//  DataCoders.swift
//  QuickWeather
//
//  Created by Maru on 15.08.2022.
//

import Foundation

public func voidEncoder(parameters: Void?, request: URLRequest) -> URLRequest {
    request
}

public func voidDecoder(_ possibleData: Data?) {
}

public func jsonDecoder<T: Decodable>(_ rawData: Data?) throws -> T {
    guard let data = rawData else {
        throw APIError.missingData
    }

    let decoder = JSONDecoder()
    decoder.dataDecodingStrategy = .base64
    decoder.dateDecodingStrategy = .secondsSince1970
    return try decoder.decode(T.self, from: data)
}
