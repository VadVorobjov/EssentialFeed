//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Vadims Vorobjovs on 31/05/2022.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
