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
    
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    
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
        animationSpringView.duration = stringToCGFloat(currentAnimation.duration)
        animationSpringView.force = stringToCGFloat(currentAnimation.force)
        
        startAnimationSpringButton.animation = currentAnimation.animation
        startAnimationSpringButton.curve = currentAnimation.curve
        startAnimationSpringButton.duration = stringToCGFloat(currentAnimation.duration)
        startAnimationSpringButton.force = stringToCGFloat(currentAnimation.force)
        
        animationSpringView.animate()
        startAnimationSpringButton.animate()
        
        animationIndex += 1
        if animationIndex == animationsData.count {
            animationIndex = 0
        }
        
        setCurrentButtonTitle()
        setAnimationInfo()
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
        setAnimationInfo()
    }
    
    private func setCurrentButtonTitle() {
        let animation = animationsData[animationIndex].animation
        let curve = animationsData[animationIndex].curve
        startAnimationSpringButton.setTitle(
            "\(animation) - \(curve)", for: .normal)
    }
    
    private func setAnimationInfo() {
        
        let currentAnimation = animationsData[animationIndex]
        
        animationLabel.text = currentAnimation.animation
        curveLabel.text = currentAnimation.curve
        durationLabel.text = String(format: "%.3f", stringToCGFloat(currentAnimation.duration))
        forceLabel.text = String(format: "%.3f", stringToCGFloat(currentAnimation.force))
    }
    
    private func stringToCGFloat(_ value: String) -> CGFloat {
        guard let valueAsDouble = Double(value) else {
            return 0
        }
        
        return CGFloat(valueAsDouble)
    }
}
