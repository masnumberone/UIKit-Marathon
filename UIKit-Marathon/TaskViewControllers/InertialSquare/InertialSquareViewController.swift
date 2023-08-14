//
//  InertialSquareViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class InertialSquareViewController: UIViewController {
    private var animator: UIDynamicAnimator!
    private var behavior: UISnapBehavior!
    private var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView()
        squareView.bounds = .init(x: 0, y: 0, width: 100, height: 100)
        squareView.center = view.center
        squareView.backgroundColor = .blue
        squareView.layer.cornerRadius = 8
        
        view.addSubview(squareView)
        view.backgroundColor = .backgroundFill
        title = "Инерционный Квадрат"
        navigationItem.largeTitleDisplayMode = .never
        
        
        animator = UIDynamicAnimator(referenceView: view)
        
        behavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        behavior.damping = 1.0
        animator.addBehavior(behavior)
        
        
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc
    func tapGesture(_ sender: UITapGestureRecognizer) {
        behavior.snapPoint = sender.location(in: view)
    }
    
    @objc
    func panGesture(_ sender: UIPanGestureRecognizer) {
        let startP = squareView.center
        
        switch sender.state {
        case .began:
            behavior.snapPoint = sender.location(in: view)
        case .ended:
            let dx = sender.location(in: view).x - startP.x
            let dy = sender.location(in: view).y - startP.y
            
            behavior.snapPoint = .init(x: sender.location(in: view).x + dx * 0.2,
                                       y: sender.location(in: view).y + dy * 0.2)
            
        case .changed:
            behavior.snapPoint = sender.location(in: view)
        default:
            break
        }
        
    }
}
