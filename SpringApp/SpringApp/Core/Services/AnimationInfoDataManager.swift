//
//  AnimationInfoDataManager.swift
//  SpringApp
//
//  Created by Егор Савковский on 04.05.2021.
//

import Foundation

class AnimationInfoDataManager {
    // MARK: - Public constants
    static let shared: AnimationInfoDataManager = AnimationInfoDataManager()
    
    let animations: [String] = [
        "shake",
        "pop",
        "morph",
        "squeeze",
        "wobble",
        "swing"
    ]
    
    let curves: [String] = [
        "spring",
        "linear",
        "easeIn",
        "easeOut",
        "easeInOut"
    ]
    
    // MARK: - Private methods
    private init() {}
}
