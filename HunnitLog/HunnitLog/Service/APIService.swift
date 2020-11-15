//
//  APIService.swift
//  simpleMVVM
//
//  Created by seungwook.jung on 2020/11/07.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError>? where Request: APIRequestType
}

final class APIService: APIServiceType {
    private let baseURL: URL?
    
    init(baseURL: URL? = URL(string: "https://my-json-server.typicode.com")) {
        self.baseURL = baseURL
    }
    
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError>? where Request : APIRequestType {
        guard let pathURL = URL(string: request.path, relativeTo: self.baseURL) else {
            return nil
        }
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = request.queryItems
        
        guard let requestURL = urlComponents?.url else {
            return nil
        }
        
        var request = URLRequest(url: requestURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

