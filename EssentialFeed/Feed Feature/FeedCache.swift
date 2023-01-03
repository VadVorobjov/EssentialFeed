//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 07/07/2022.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
