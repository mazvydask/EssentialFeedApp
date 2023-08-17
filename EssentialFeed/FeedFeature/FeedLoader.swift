//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 09/08/2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
