//
//  ThreeButtonsViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class ThreeButtonsViewController: UIViewController {
    var firstButton: CustomButton!
    var secondButton: CustomButton!
    var thirdButton: CustomButton!
    var animator: UIViewPropertyAnimator!
    
    var animationDuration = 0.1
    var animationScale = 0.8
    var labelDuration: UILabel!
    var labelScale: UILabel!
    
    var durationString: String {
        get {
            String(format: "animationDuration = %.2f", animationDuration)
        }
    }
    
    var scaleString: String {
        get {
            String(format: "animationScale = %.2f", animationScale)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Три кнопки"
        navigationItem.largeTitleDisplayMode = .never
        
        setupButtonsAndConstraints()
        setupButtonTargets()
        setupSlidersAndConstraints()
        
    }
    
    func setupButtonsAndConstraints() {
        firstButton = CustomButton()
        secondButton = CustomButton()
        thirdButton = CustomButton()
        
        view.addSubview(firstButton)
        firstButton.setTitle("first button", for: .normal)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  30).isActive = true
        
        view.addSubview(secondButton)
        secondButton.setTitle("second large button", for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(thirdButton)
        thirdButton.setTitle("third", for: .normal)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
    }
    
    
    func setupButtonTargets() {
        firstButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        firstButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        secondButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        secondButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        thirdButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        thirdButton.addTarget(nil, action: #selector(showModalVC), for: .touchUpInside)
    }
    
    func setupSlidersAndConstraints() {
        labelDuration = UILabel()
        view.addSubview(labelDuration)
        labelDuration.text = durationString
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        labelDuration.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant:  40).isActive = true
        
        let slider1 = UISlider()
        view.addSubview(slider1)
        slider1.translatesAutoresizingMaskIntoConstraints = false
        slider1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider1.topAnchor.constraint(equalTo: labelDuration.bottomAnchor).isActive = true
        slider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        slider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        slider1.value = Float(animationDuration)
        
        slider1.addTarget(self, action: #selector(didChangeTime), for: .valueChanged)
        
        labelScale = UILabel()
        view.addSubview(labelScale)
        labelScale.text = scaleString
        labelScale.translatesAutoresizingMaskIntoConstraints = false
        labelScale.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        labelScale.topAnchor.constraint(equalTo: slider1.bottomAnchor, constant:  40).isActive = true
        
        let slider2 = UISlider()
        view.addSubview(slider2)
        slider2.translatesAutoresizingMaskIntoConstraints = false
        slider2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider2.topAnchor.constraint(equalTo: labelScale.bottomAnchor).isActive = true
        slider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        slider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        slider2.value = Float(animationScale)
        
        slider2.addTarget(self, action: #selector(didChangeScale), for: .valueChanged)
    }
    
    @objc
    func buttonPressed(_ sender: UIButton) {
        animator = UIViewPropertyAnimator(duration: (animationDuration == 0) ? 0.01 : animationDuration, curve: .easeInOut)
        animator.addAnimations {
            sender.transform = CGAffineTransform(scaleX: self.animationScale, y: self.animationScale)
        }
        animator.startAnimation()
    }
    
    @objc
    func buttonReleased(_ sender: UIButton) {
        animator = UIViewPropertyAnimator(duration: (animationDuration == 0) ? 0.01 : animationDuration, curve: .easeInOut)
        animator.addAnimations {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        animator.startAnimation()
    }
    
    
    @objc
    func showModalVC() {
        let modalViewController = UIViewController()
        modalViewController.view.backgroundColor = .systemBackground
        
        
        self.present(modalViewController, animated: true)
    }
    
    @objc
    func didChangeTime(_ sender: UISlider) {
        animationDuration = TimeInterval(sender.value)
        labelDuration.text = durationString
    }
    
    @objc
    func didChangeScale(_ sender: UISlider) {
        animationScale = Double(sender.value)
        labelScale.text = scaleString
    }
    
}
