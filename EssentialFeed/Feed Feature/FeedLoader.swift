//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 16/08/2021.
//

import Foundation

public enum LoadFeedResult {
	case success([FeedItem])
	case failure(Error)
}

protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
