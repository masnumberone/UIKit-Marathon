//
//  CustomButton.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var configuration: UIButton.Configuration = .filled()
        configuration.image = UIImage(systemName: "chevron.forward.square.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        layer.cornerRadius = 8
        self.configuration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if(tintAdjustmentMode == .dimmed) {
            layer.backgroundColor = UIColor.magenta.cgColor
        } else {
            layer.backgroundColor = nil
        }
    }
    
}
