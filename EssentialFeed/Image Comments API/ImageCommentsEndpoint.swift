//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 13/11/2022.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
