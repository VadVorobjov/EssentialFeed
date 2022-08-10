//
//  ImageComment.swift
//  EssentialFeed
//
//  Created by Vadims Vorobjovs on 10/08/2022.
//

import Foundation

public struct ImageComment: Equatable {
    public let id: UUID
    public let message: String
    public let createdAt: Data
    public let username: String
    
    public init(id: UUID, message: String, createdAt: Data, username: String) {
        self.id = id
        self.message = message
        self.createdAt = createdAt
        self.username = username
    }
}
