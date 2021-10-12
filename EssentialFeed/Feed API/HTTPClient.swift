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
	/// The completion handler can be invoked in any thread.
	/// Clients are responsible to dispatch to appropriate threads, if needed.
	func get(from URL: URL, completion: @escaping (HTTPClientResult) -> Void)
}
