//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 12/07/2022.
//

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
