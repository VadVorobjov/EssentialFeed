//
//  FeedImagePresenter.swift
//  EssentialFeediOS
//
//  Created by Vadims Vorobjovs on 25/03/2022.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
