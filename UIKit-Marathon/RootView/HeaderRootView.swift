//
//  HeaderRootView.swift
//  UIKit-Marathon
//
//  Created by work on 14.08.2023.
//

import UIKit

class HeaderRootView: UIView {
    private let largeTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blueDark
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .blueDark
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(largeTitleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            largeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            largeTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            largeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            largeTitleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 6),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: largeTitleLabel.widthAnchor, multiplier: 1/2)
        ])
    }
    
    func configure(with model: RootViewModel) {
        largeTitleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
