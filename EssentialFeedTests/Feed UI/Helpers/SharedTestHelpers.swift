//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 03/10/2021.
//

import Foundation

func anyNSError() -> NSError {
	return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
	return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
