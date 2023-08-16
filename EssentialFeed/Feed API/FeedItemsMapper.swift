//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 16/08/2023.
//

import Foundation

internal final class FeedItemsMapper {
    
    private struct Root: Decodable {
        let items: [Item]
    }
    
    public struct Item: Decodable {
        public let id: UUID
        public let description: String?
        public let location: String?
        public let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        let root = try JSONDecoder().decode(Root.self, from: data)
        return root.items.map { $0.item }
    }
}
