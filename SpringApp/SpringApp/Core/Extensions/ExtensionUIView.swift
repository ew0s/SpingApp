//
//  ExtensionUIView.swift
//  SpringApp
//
//  Created by Егор Савковский on 04.05.2021.
//

import UIKit

extension UIView {
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
              self.layer.cornerRadius = radius
              self.layer.maskedCorners = [CACornerMask]
    }
}
