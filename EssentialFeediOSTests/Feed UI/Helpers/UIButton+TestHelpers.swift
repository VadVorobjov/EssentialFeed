//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vadims Vorobjovs on 13/04/2022.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}

