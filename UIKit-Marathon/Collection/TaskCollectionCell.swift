//
//  TaskCollectionCell.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class TaskCollectionCell: UICollectionViewCell {
    static let identifier = "TaskCollectionCell"
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: 0x1C2039)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(bottomBackgroundView)
        contentView.addSubview(title)

        contentView.layer.cornerCurve = .continuous
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -94 / 2),
            imageView.heightAnchor.constraint(equalToConstant: 203),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            
            bottomBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomBackgroundView.heightAnchor.constraint(equalToConstant: 94),
            
            title.centerXAnchor.constraint(equalTo: bottomBackgroundView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: bottomBackgroundView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: TaskItem) {
        title.text = item.title.uppercased()
        contentView.backgroundColor = .init(hex: item.backgroundColor)
        imageView.image = UIImage(named: item.imageName)
    }
}
