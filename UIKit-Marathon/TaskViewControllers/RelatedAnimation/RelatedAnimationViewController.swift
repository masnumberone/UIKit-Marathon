//
//  RelatedAnimationViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class RelatedAnimationViewController: UIViewController {
    private lazy var squereView = UIView(frame: .init(x: 0, y: 0, width: 130, height: 130))
    private lazy var slider = UISlider()
    private lazy var animator = UIViewPropertyAnimator(duration: .zero, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Связанная Анимация"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .backgroundFill
        
        view.layoutMargins = .init(top: 100, left: 20, bottom: 10, right: 20)
        
        view.addSubview(squereView)
        squereView.frame.origin = .init(x: view.layoutMargins.left, y: view.layoutMargins.top)
        squereView.backgroundColor = .orange
        squereView.layer.cornerRadius = 16
        
        view.addSubview(slider)
        slider.center.x = view.center.x
        slider.frame.origin = .init(x: view.layoutMargins.left, y: 300)
        slider.frame.size.width = view.frame.width - view.layoutMargins.left - view.layoutMargins.right
        slider.tintColor = .orange
        
        configureAnimator()
        slider.addTarget(self, action: #selector(didValueChanged), for: .allTouchEvents)
    }
    
    func configureAnimator() {
        animator.pausesOnCompletion = true
        
        let scale = CGFloat(1.5)
        let rotateAngle = (CGFloat.pi) / 2
        
        let squareWidth = squereView.bounds.width
        let viewWidth = view.bounds.width
        let leftMargin = view.layoutMargins.left
        let rightMargin = view.layoutMargins.right
        
        let offsetCenterX = viewWidth - (leftMargin + rightMargin + squareWidth * 1.25)
        
        animator.addAnimations {
            self.squereView.transform = CGAffineTransform(scaleX: scale, y: scale).rotated(by: rotateAngle)
            self.squereView.center.x = leftMargin + squareWidth / 2 + offsetCenterX
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        animator.pausesOnCompletion = false
        animator.startAnimation()
    }
    
    @objc
    func didValueChanged(_ sender: UISlider) {
        switch sender.isTracking {
        case true:
            animator.fractionComplete = CGFloat(sender.value)
        case false:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 1)
            UIView.animate(withDuration: 0.3) {
                sender.setValue(1, animated: true)
            }
        }
    }
}
