//
//  CaringCollectionViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class CaringCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .backgroundFill
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        title = "Заботливая Коллекция"
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(collectionView)
        view.backgroundColor = .backgroundFill
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = .init(x: 0,
                                     y: view.layoutMargins.top,
                                     width: view.frame.width,
                                     height: view.frame.height - view.layoutMargins.top - view.layoutMargins.bottom)
        
        collectionView.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInset = collectionView.layoutMargins
        collectionView.contentOffset.x = -collectionView.contentInset.left
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.1662506163, green: 0.5600816011, blue: 0.7882310748, alpha: 1)
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 250, height: 500)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // тут надо бы получать таргет ячейку, прибаввлять половину ширины и только потом определять конечную таргет ячейку
        let targetOffset = CGPoint(x: targetContentOffset.pointee.x + 125, y: 200)
        let targetIndexPath = collectionView.indexPathForItem(at: targetOffset) ?? .init(item: 0, section: 0)
        var offset: CGPoint
        
        if (targetOffset.x == scrollView.contentSize.width - view.frame.width) {
            let lastIndexPath = IndexPath(item: collectionView.numberOfItems(inSection: 0) - 1, section: 0)
            offset = layout.layoutAttributesForItem(at: lastIndexPath)!.frame.origin
        } else {
            offset = layout.layoutAttributesForItem(at: targetIndexPath)?.frame.origin ?? targetOffset
            offset = .init(x: offset.x - collectionView.layoutMargins.left, y: offset.y)
        }
        
        targetContentOffset.pointee = offset
    }
}
