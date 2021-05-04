//
//  SpringAnimation.swift
//  SpringApp
//
//  Created by Егор Савковский on 04.05.2021.
//

import UIKit

struct SpringAnimation {
    let animation: String
    let curve: String
    let duration: CGFloat
    let force: CGFloat
}

extension SpringAnimation {
    public static func getData() -> [SpringAnimation] {
        
        let defaultDuration: CGFloat = 1
        let defaultForce: CGFloat = 1
        
        let animationDataManager = AnimationInfoDataManager.shared
        var springAnimations: [SpringAnimation] = []
        
        for animation in animationDataManager.animations {
            for curve in animationDataManager.curves {
                
                let springAnimation = SpringAnimation(
                    animation: animation,
                    curve: curve,
                    duration: defaultDuration,
                    force: defaultForce
                )
                
                springAnimations.append(springAnimation)
            }
        }
        
        return springAnimations
    }
}
