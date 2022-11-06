//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Vadims Vorobjovs on 31/05/2022.
//

import UIKit
import EssentialFeed

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
