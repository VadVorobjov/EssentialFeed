//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 16/08/2021.
//

import Foundation

public struct FeedItem: Equatable {
	let id: UUID
	let description: String?
	let location: String?
	let imageURL: URL
}
