//
//  PopoverViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class PopoverViewController: UIViewController {
    private lazy var setHeight280 = UIAction(title: "280px", handler: { _ in
        self.preferredContentSize = .init(width: 300, height: 280)
    })
    
    private lazy var setHeight150 = UIAction(title: "150px", handler: { _ in
        self.preferredContentSize = .init(width: 300, height: 150)
    })
    
    override func viewDidLoad() {
        let segmetedControl = UISegmentedControl(items: [setHeight280, setHeight150])
        view.addSubview(segmetedControl)
        
        segmetedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmetedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmetedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        segmetedControl.selectedSegmentIndex = 0
        setHeight280.performWithSender(nil, target: nil)
        
        
        let dismissButton = UIButton(type: .close)
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchDown)
    }
    
    @objc
    func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
    
}
