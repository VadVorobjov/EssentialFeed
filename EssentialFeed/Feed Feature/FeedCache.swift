//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 07/07/2022.
//

import Foundation

public protocol FeedCache {
    typealias SaveResult = Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void)
}
