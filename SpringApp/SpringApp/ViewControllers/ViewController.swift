//
//  ViewController.swift
//  SpringApp
//
//  Created by Егор Савковский on 04.05.2021.
//

import Spring

class ViewController: UIViewController {
    
    // MARK: - Private constants
    private let animationsData = SpringAnimation.getData()
    private var animationIndex = 0
    
    // MARK: - IB Outlets
    @IBOutlet var animationSpringView: SpringView!
    @IBOutlet var buttonBackgroundView: UIView!
    @IBOutlet var startAnimationSpringButton: SpringButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - IB Actions
    @IBAction func startAnimationButtonTapped(_ sender: Any) {
        
        let currentAnimation = animationsData[animationIndex]
        
        animationSpringView.animation = currentAnimation.animation
        animationSpringView.curve = currentAnimation.curve
        animationSpringView.duration = currentAnimation.duration
        animationSpringView.force = currentAnimation.force
        
        startAnimationSpringButton.animation = currentAnimation.animation
        startAnimationSpringButton.curve = currentAnimation.curve
        startAnimationSpringButton.duration = currentAnimation.duration
        startAnimationSpringButton.force = currentAnimation.force
        
        animationSpringView.animate()
        startAnimationSpringButton.animate()
        
        animationIndex += 1
        if animationIndex == animationsData.count {
            animationIndex = 0
        }
        
        setCurrentButtonTitle()
    }
}

// MARK: - Private methods
extension ViewController {
    private func setView() {
        animationSpringView.layer.cornerRadius = 15
        startAnimationSpringButton.layer.cornerRadius = 10
        
        buttonBackgroundView.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner],
                                          radius: buttonBackgroundView.frame.height / 2)
        setCurrentButtonTitle()
    }
    
    private func setCurrentButtonTitle() {
        let animation = animationsData[animationIndex].animation
        let curve = animationsData[animationIndex].curve
        startAnimationSpringButton.setTitle(
            "\(animation) - \(curve)", for: .normal)
    }
}
