//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 16/08/2023.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
