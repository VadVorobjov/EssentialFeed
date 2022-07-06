//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Vadims Vorobjovs on 06/07/2022.
//

import EssentialFeed

public class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
