//
//  XCTTestCase+MemoryLeakTrackingHelper.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 31/08/2021.
//

import XCTest

extension XCTestCase {
	func trackForMemoeryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
		addTeardownBlock { [weak instance] in
			XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.",
						 file: file,
						 line: line)
		}
	}
}
