//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 24/08/2021.
//

import Foundation

public enum HTTPClientResult {
	case success(Data, HTTPURLResponse)
	case failure(Error)
}

public protocol HTTPClient {
	func get(from URL: URL, completion: @escaping (HTTPClientResult) -> Void)
}
