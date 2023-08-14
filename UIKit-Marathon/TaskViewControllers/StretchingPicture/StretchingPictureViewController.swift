//
//  StretchingPictureViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class StretchingPictureViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    
    var constraintScale: [NSLayoutConstraint]!
    var constraintOrigin: [NSLayoutConstraint]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Растягивающаяся Картинка"
        navigationItem.largeTitleDisplayMode = .never
        
        let scroll = UIScrollView()
        view.addSubview(scroll)
        
        scroll.frame = .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        let image = UIImage(named: "buildingImage")
        imageView = UIImageView(image: image!)
        imageView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 270)
        scroll.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        scroll.contentSize = .init(width: scroll.frame.width, height: 1500)
        scroll.contentInset.top = 270
        scroll.verticalScrollIndicatorInsets.top = 270
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.alwaysBounceVertical = true
        
        scroll.delegate = self
        
        let multiplier = image!.size.height / image!.size.width
        
        constraintScale = [
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: multiplier),
            imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: -(imageView.bounds.width * multiplier - imageView.bounds.height)),
            imageView.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        constraintOrigin = [
            imageView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: multiplier),
            imageView.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        scroll.contentOffset.y = -270
        NSLayoutConstraint.activate(constraintOrigin)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if((scrollView.contentOffset.y + scrollView.adjustedContentInset.top) < 0) {
            NSLayoutConstraint.deactivate(constraintOrigin)
            NSLayoutConstraint.activate(constraintScale)
            scrollView.verticalScrollIndicatorInsets.top = -(scrollView.contentOffset.y + scrollView.safeAreaInsets.top)
        } else {
            NSLayoutConstraint.deactivate(constraintScale)
            NSLayoutConstraint.activate(constraintOrigin)
            
            
        }
    }
    
    
    
}
