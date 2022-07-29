//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Vadims Vorobjovs on 27/07/2022.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.main.run(until: Date())
    }
}
