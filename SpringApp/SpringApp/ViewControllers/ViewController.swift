//
//  ViewController.swift
//  SpringApp
//
//  Created by Егор Савковский on 04.05.2021.
//

import Spring

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animationSpringView: SpringView!
    @IBOutlet var buttonBackgroundView: UIView!
    @IBOutlet var startAnimationSpringButton: SpringButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
}

// MARK: - Private methods
extension ViewController {
    private func setBackground() {
        animationSpringView.layer.cornerRadius = 15
        startAnimationSpringButton.layer.cornerRadius = 10
        buttonBackgroundView.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner],
                                          radius: buttonBackgroundView.frame.height / 2)
    }
}
