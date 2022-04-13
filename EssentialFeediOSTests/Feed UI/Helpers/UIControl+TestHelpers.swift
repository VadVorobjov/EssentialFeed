//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vadims Vorobjovs on 13/04/2022.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}

