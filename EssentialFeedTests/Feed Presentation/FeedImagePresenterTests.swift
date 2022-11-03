//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 05/06/2022.
//

import XCTest
import EssentialFeed

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_crestesViewoModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
  
}
