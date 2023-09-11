//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 11/09/2023.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let image: URL
}
