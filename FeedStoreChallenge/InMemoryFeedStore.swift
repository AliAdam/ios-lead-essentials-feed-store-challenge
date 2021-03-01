//
//  InMemoryFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Ali Adam on 01/03/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class InMemoryFeedStore: FeedStore {
	typealias Cache = (feed: [LocalFeedImage], timestamp: Date)
	private var cache: Cache?
	public init() {}
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		cache = Cache(feed: feed, timestamp: timestamp)
		completion(nil)
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		switch cache {
		case .some(let cacheData):
			completion(.found(feed: cacheData.feed, timestamp: cacheData.timestamp))
		default:
			completion(.empty)
		}
		
	}
}
