//
//  URLSessionHTTPClieant.swift
//  EssentialFeedTests
//
//  Created by Mazvydas Katinas on 23/08/2023.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(sesssion: URLSession = .shared) {
        self.session = sesssion
    }
    
    struct UnexpectedValueRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValueRepresentation()))
            }
        }.resume()
    }
}
