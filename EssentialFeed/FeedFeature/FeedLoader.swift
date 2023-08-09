//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 09/08/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
