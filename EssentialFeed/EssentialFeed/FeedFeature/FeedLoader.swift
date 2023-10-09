//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 09/08/2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
