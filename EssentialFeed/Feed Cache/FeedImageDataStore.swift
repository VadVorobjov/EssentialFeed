//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 13/06/2022.
//

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
