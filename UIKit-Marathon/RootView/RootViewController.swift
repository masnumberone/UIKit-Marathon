//
//  RootViewController.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

class RootViewController: UIViewController {
    private var viewModel: RootViewModel
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, environment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(326),
                                                   heightDimension: .absolute(480))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.interGroupSpacing = 64
            return section
        }
    }
    
    private let titleView: HeaderRootView = {
        let view = HeaderRootView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        titleView.configure(with: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleView)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        
        view.backgroundColor = .backgroundFill
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TaskCollectionCell.self, forCellWithReuseIdentifier: TaskCollectionCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.clipsToBounds = false
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 34),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionCell.identifier, for: indexPath) as? TaskCollectionCell else {
            return .init()
        }
        
        cell.configure(with: viewModel.items[indexPath.item])
        
        return cell
    }
}

extension RootViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.onItemSelected?(indexPath.item)
    }
}

