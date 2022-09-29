//
//  APIRequest.swift
//  QuickWeather
//
//  Created by Maru on 15.08.2022.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

protocol Request {
    associatedtype Input
    associatedtype Output

    var endpoint: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String] { get }
    var headers: [String: String] { get }
    var parameters: Input? { get }

    var encoder: (Input?, URLRequest) throws -> URLRequest { get }
    var decoder: (Data?) throws -> Output { get }
}

struct AnyRequest<Input, Output>: Request {
    var endpoint: String
    var method: HTTPMethod
    var queryParameters: [String: String] = [:]
    var headers: [String: String] = [:]
    var parameters: Input?

    var encoder: (Input?, URLRequest) throws -> URLRequest
    var decoder: (Data?) throws -> Output
}
