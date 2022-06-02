//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 02/06/2022.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expect no view message")
    }
    
    // MARK: Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
    
}

