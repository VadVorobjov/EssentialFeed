//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 29/09/2021.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTests: XCTestCase {

	func test_init_doesNotMessageStoreUponCreation() {
		let (_, store) = makeSUT()

		XCTAssertEqual(store.receivedMessages, [])
	}

	// MAKR: - Helpers

	private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
		let store = FeedStoreSpy()
		let sut = LocalFeedLoader(store: store, currentDate: currentDate)

		trackForMemoryLeaks(store, file: file, line: line)
		trackForMemoryLeaks(sut)

		return (sut, store)
	}

	private class FeedStoreSpy: FeedStore {
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

}
