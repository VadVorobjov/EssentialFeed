//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 06/06/2022.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
