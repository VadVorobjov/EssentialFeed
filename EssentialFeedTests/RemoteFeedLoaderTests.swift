//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 17/08/2021.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient {
	var requestedURL: String?
}

class RemoteFeedLoaderTest: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClient()
		_ = RemoteFeedLoader()

		XCTAssertNil(client.requestedURL)
	}
}
