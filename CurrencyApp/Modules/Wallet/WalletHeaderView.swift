//
//  TableViewHeaderView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 15.03.2023.
//

import UIKit

struct TableViewHeaderViewModel {
    var items: [WalletCollectionViewCellViewModel]?
    var willReload: EmptyClosure?
    let widthOfHeader = UIView.screenWidth
    let heightOfHeader = UIView.screenWidth * 0.6
}

final class TableViewHeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var viewModel: TableViewHeaderViewModel?
    
    static let identifier = String(describing: TableViewHeaderView.self)
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 0, width: frame.width - 20 - 20, height: frame.height - 20 - 20), collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
    }()

    
    // MARK: - UICollectionView
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 0.631)
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCardCollectionViewCell.identifier, for: indexPath) as? WalletCardCollectionViewCell
        else { return UICollectionViewCell() }
        
        if let creditCard = viewModel?.items?[indexPath.row].creditCard {
            let cellViewModel = WalletCollectionViewCellViewModel(content: (creditCard))
            cellViewModel.isFirst = indexPath.row == 0
            cellViewModel.isLast = indexPath.row == ((viewModel?.items?.count ?? 1) - 1)
            cell.configure(with: cellViewModel)
        }
        return cell
    }
    
    
    // MARK: - Inits

    init (viewModel: TableViewHeaderViewModel, frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
        configureComponent(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Constraints
    
    private let horizontalMargin = CGFloat(20)
    private let verticalMargin = CGFloat(20)
    
    func collectionViewConstraints(collection: UICollectionView) {
        collection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: horizontalMargin).isActive = true
        collection.widthAnchor.constraint(equalToConstant: self.frame.width - horizontalMargin - horizontalMargin).isActive = true
        collection.heightAnchor.constraint(equalToConstant: self.frame.width * 0.6 ).isActive = true
    }
    
    private func setUpCollectionView() {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionViewConstraints(collection: collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(WalletCardCollectionViewCell.self, forCellWithReuseIdentifier: WalletCardCollectionViewCell.identifier)
    }
    
    func configureComponent(with content: TableViewHeaderViewModel) {
        self.viewModel = content
        viewModel?.willReload = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

public extension UIView {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}
