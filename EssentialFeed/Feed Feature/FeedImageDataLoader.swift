//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Vadims Vorobjovs on 20/02/2022.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
