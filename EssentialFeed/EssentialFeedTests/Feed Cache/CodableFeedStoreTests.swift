//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Mazvydas Katinas on 16/10/2023.
//

import XCTest
import EssentialFeed

class CodableFeedStoreTests: XCTestCase {
    
    class CodableFeedStore {
        func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
            completion(.empty)
        }
    }
    
    func test_retrieve_deliverEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrieve { result in
            switch result {
            case .empty:
                break
            default: 
                XCTFail("Expected empty result, got \(result)")
            }
            
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
}
