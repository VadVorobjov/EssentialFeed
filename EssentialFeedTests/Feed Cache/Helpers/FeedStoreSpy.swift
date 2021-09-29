//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 29/09/2021.
//

import Foundation
import EssentialFeed

class FeedStoreSpy: FeedStore {
	enum ReceivedMessage: Equatable {
		case deleteCachedFeed
		case insert([LocalFeedImage], Date)
	}

	private(set) var receivedMessages = [ReceivedMessage]()

	private var deletionCompletions = [DeletionCompletion]()
	private var insertionCompletions = [InsertionCompletion]()

	func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		deletionCompletions.append(completion)
		receivedMessages.append(.deleteCachedFeed)
	}

	func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		insertionCompletions.append(completion)
		receivedMessages.append(.insert(feed, timestamp))
	}

	func completeDeletionSuccessfully(at index: Int = 0) {
		deletionCompletions[index](nil)
	}

	func completeDeletion(with error: NSError, at index: Int = 0) {
		deletionCompletions[index](error)
	}

	func completeInsertion(with error: Error,at index: Int = 0) {
		insertionCompletions[index](error)
	}

	func completeInsertionSuccessfully(at index: Int = 0) {
		insertionCompletions[index](nil)
	}
}
