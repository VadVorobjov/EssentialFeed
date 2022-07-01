//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Vadims Vorobjovs on 01/07/2022.
//

import Foundation

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
