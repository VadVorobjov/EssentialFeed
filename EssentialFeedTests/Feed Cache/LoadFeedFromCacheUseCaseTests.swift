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
}
