//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Mazvydas Katinas on 09/08/2023.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
