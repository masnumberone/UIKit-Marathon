//
//  GradientAndShadowViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class GradientAndShadowViewController: UIViewController {
    var squareView = UIView()
    var squareViewLayer = CAGradientLayer()
    let squareSize = CGSize(width: 100, height: 100)
    let gradientColors = [#colorLiteral(red: 0.984562099, green: 0.02928770892, blue: 0.2500837147, alpha: 1), #colorLiteral(red: 0.08912231773, green: 0.4647620916, blue: 0.6973915696, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(squareView)
        view.backgroundColor = .white
        title = "Градиент и Тень"
        
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: squareSize.width).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: squareSize.height).isActive = true
        
        squareView.layer.shadowPath = UIBezierPath(rect: squareView.bounds).cgPath
        squareView.layer.addSublayer(squareViewLayer)
    }
    
    override func viewDidLayoutSubviews() {
        squareViewLayer.frame = squareView.bounds
        
        squareViewLayer.colors = gradientColors.map({ $0.cgColor })
        squareViewLayer.startPoint = CGPoint(x: 1, y: 0)
        squareViewLayer.endPoint = CGPoint(x: 0, y: 1)
        squareViewLayer.cornerRadius = 16
        
        squareViewLayer.shadowColor = UIColor.black.cgColor
        squareViewLayer.shadowOpacity = 0.2
        squareViewLayer.shadowOffset = CGSize(width: -8, height: 8)
    }
}
