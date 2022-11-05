//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Vadims Vorobjovs on 05/11/2022.
//

import XCTest
import EssentialFeed

class ImageCommentsLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

}
