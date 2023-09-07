//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Mazvydas Katinas on 07/09/2023.
//

import XCTest
class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deletedCachedFeedCallCount = 0
}

final class CacheFeedUseCaseTests: XCTestCase {

    func test() {
        let store  = FeedStore()
        let sut = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deletedCachedFeedCallCount, 0)
    }

}
