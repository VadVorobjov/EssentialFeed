//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 24/09/2021.
//

import XCTest
import EssentialFeed

class CacheFeedUseCaseTests: XCTestCase {

	func test_init_doesNotMessageStoreUponCreation() {
		let (_, store) = makeSUT()

		XCTAssertEqual(store.receivedMessages, [])
	}

	func test_save_reuqestCacheDeletion() {
		let (sut, store) = makeSUT()

		sut.save(uniqueItems().models) { _ in }

		XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
	}

	func test_save_doesNotRequestCacheInsertionOnDeletionError() {
		let (sut, store) = makeSUT()
		let deletionError = anyNSError()

		sut.save(uniqueItems().models) { _ in }
		store.completeDeletion(with: deletionError)
		
		XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
	}

	func test_save_requestsNewCacheInsertionWithTimestampOnSuccessfulDeletion() {
		let timestamp = Date()
		let items = uniqueItems()
		let (sut, store) = makeSUT(currentDate: { timestamp })

		sut.save(items.models) { _ in }
		store.completeDeletionSuccessfully()

		XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed, .insert(items.local, timestamp)])
	}

	func test_save_failsOnDeletionError() {
		let (sut, store) = makeSUT()
		let deletionError = anyNSError()

		expect(sut, toCompleteWithError: deletionError, when: {
			store.completeDeletion(with: deletionError)
		})
	}

	func test_save_failsOnInsertionError() {
		let (sut, store) = makeSUT()
		let insertionError = anyNSError()

		expect(sut, toCompleteWithError: insertionError, when: {
			store.completeDeletionSuccessfully()
			store.completeInsertion(with: insertionError)
		})
	}

	func test_save_succeedsOnSuccessfulCacheInsertion() {
		let (sut, store) = makeSUT()

		expect(sut, toCompleteWithError: nil, when: {
			store.completeDeletionSuccessfully()
			store.completeInsertionSuccessfully()
		})
	}

	func test_save_doesNotDeliverDeletionErrorAfterSUTInstanceHasBeenDeallocated() {
		let store = FeedStoreSpy()
		var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)

		var receivedResults = [LocalFeedLoader.SaveResult]()
		sut?.save(uniqueItems().models) { receivedResults.append($0) }

		sut = nil
		store.completeDeletion(with: anyNSError())

		XCTAssertTrue(receivedResults.isEmpty)
	}

	func test_save_doesNotDeliverInsertionErrorAfterSUTInstanceHasBeenDeallocated() {
		let store = FeedStoreSpy()
		var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)

		var receivedResults = [Error?]()
		sut?.save(uniqueItems().models) { receivedResults.append($0) }

		store.completeDeletionSuccessfully()
		sut = nil
		store.completeInsertion(with: anyNSError())

		XCTAssertTrue(receivedResults.isEmpty)
	}

	// MAKR: - Helpers

	private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
		let store = FeedStoreSpy()
		let sut = LocalFeedLoader(store: store, currentDate: currentDate)

		trackForMemoryLeaks(store, file: file, line: line)
		trackForMemoryLeaks(sut)

		return (sut, store)
	}

	private func expect(_ sut: LocalFeedLoader, toCompleteWithError expectedError: NSError?, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
		let exp = expectation(description: "Wait for save completion")

		var receivedError: Error?
		sut.save(uniqueItems().models) { error in
			receivedError = error
			exp.fulfill()
		}

		action()
		wait(for: [exp], timeout: 1.0)

		XCTAssertEqual(receivedError as NSError?, expectedError, file: file, line: line)
	}

	private class FeedStoreSpy: FeedStore {
		enum ReceivedMessage: Equatable {
			case deleteCachedFeed
			case insert([LocalFeedItem], Date)
		}

		private(set) var receivedMessages = [ReceivedMessage]()

		private var deletionCompletions = [DeletionCompletion]()
		private var insertionCompletions = [InsertionCompletion]()

		func deleteCachedFeed(completion: @escaping DeletionCompletion) {
			deletionCompletions.append(completion)
			receivedMessages.append(.deleteCachedFeed)
		}

		func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion) {
			insertionCompletions.append(completion)
			receivedMessages.append(.insert(items, timestamp))
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


	private func uniqueItem() -> FeedItem {
		return FeedItem(id: UUID(), description: "any", location: "any", imageURL: anyURL())
	}

	private func uniqueItems() -> (models: [FeedItem], local: [LocalFeedItem]) {
		let models = [uniqueItem(), uniqueItem()]
		let local = models.map { LocalFeedItem(id: $0.id, description: $0.description, location: $0.location, imageURL: $0.imageURL) }
		return (models, local)
	}

	private func anyURL() -> URL {
		return URL(string: "http://any-url.com")!
	}

	private func anyNSError() -> NSError {
		return NSError(domain: "any error", code: 0)
	}
}