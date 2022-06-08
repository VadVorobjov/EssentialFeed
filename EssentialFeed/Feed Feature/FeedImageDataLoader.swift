//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Vadims Vorobjovs on 20/02/2022.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
