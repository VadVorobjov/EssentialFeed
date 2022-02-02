//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 16/08/2021.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>

    func load(completion: @escaping (FeedLoader.Result) -> Void)
}
