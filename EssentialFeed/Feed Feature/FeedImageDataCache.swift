//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 12/07/2022.
//

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
