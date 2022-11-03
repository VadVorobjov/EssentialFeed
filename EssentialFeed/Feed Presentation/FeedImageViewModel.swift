//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 06/06/2022.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
