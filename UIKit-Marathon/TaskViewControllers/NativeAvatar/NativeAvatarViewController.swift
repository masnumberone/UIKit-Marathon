//
//  NativeAvatarViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class NativeAvatarViewController: UIViewController, UINavigationControllerDelegate {
    private let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Нативный Аватар"
        view.backgroundColor = .backgroundFill
        navigationItem.largeTitleDisplayMode = .always
        
        let scrollView = UIScrollView(frame: .init(x: 0,
                                                   y: 0,
                                                   width: view.frame.width,
                                                   height: view.frame.height))
        scrollView.contentSize = .init(width: scrollView.frame.width,
                                       height: 1500)
        view.addSubview(scrollView)
        navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        guard viewController == self else {
            imageView.removeFromSuperview()
            return
        }
        
        navigationController.navigationBar.subviews.forEach { subview in
            let stringFromClass = subview.description
            guard stringFromClass.contains("UINavigationBarLargeTitleView") else { return }

            if imageView.superview != subview {
                imageView.removeFromSuperview()
                subview.addSubview(imageView)

                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.removeConstraints(imageView.constraints)

                NSLayoutConstraint.activate([
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -10),
                    imageView.widthAnchor.constraint(equalToConstant: 36),
                    imageView.heightAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.delegate = nil
    }
}
