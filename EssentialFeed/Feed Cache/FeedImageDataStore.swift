//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 13/06/2022.
//

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
