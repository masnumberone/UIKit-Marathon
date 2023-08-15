//
//  CompactControllerViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class CompactControllerViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    private let button = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Компактный Контроллер"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .backgroundFill
        
        view.addSubview(button)
        button.setTitle("Present", for: .normal)
        button.sizeToFit()
        button.center.x = view.frame.width / 2
        button.frame.origin.y = 100
        
        button.addTarget(self, action: #selector(presentPopover(_:)), for: .touchUpInside)
    }
    
    @objc
    func presentPopover(_ sender: UIButton) {
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .popover
        popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        popoverVC.popoverPresentationController?.sourceView = sender
        popoverVC.popoverPresentationController?.delegate = self
        popoverVC.view.backgroundColor = .systemBackground
        
        present(popoverVC, animated: true)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
