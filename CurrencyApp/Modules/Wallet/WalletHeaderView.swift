//
//  TableViewHeaderView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 15.03.2023.
//

import UIKit

struct WalletHeaderViewModel {
    var items: [WalletCollectionViewCellViewModel] = [WalletCollectionViewCellViewModel(content: nil, state: .addCard)]
    var willReload: EmptyClosure?
    var openDetailsPage: ((WalletCollectionViewCellViewModel?) -> Void)?
    var openAddCardAlert: EmptyClosure?
    let widthOfHeader = UIView.screenWidth
    let heightOfHeader = UIView.screenWidth * 0.6
    
    func getWalletCollectionViewCellViewModel(at indexPath: IndexPath) -> WalletCollectionViewCellViewModel?{
//        if let items = items {
           return items[indexPath.row]
//        }
//        return nil
    }
}

final class WalletHeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    // MARK: Constants
    
    private let horizontalMargin = CGFloat(20)
    private let verticalMargin = CGFloat(20)
    
    // MARK: Content
    
    var viewModel: WalletHeaderViewModel?
    static let identifier = String(describing: WalletHeaderView.self)
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 20,
                                                            y: 0,
                                                            width: frame.width - 2 * horizontalMargin,
                                                            height: frame.height - 2 * verticalMargin), collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
    }()

    
    // MARK: - Initialization

    init (viewModel: WalletHeaderViewModel, frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
        configureComponent(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    // MARK: - View
    // MARK: Configure
    
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
    
    private func configureComponent(with content: WalletHeaderViewModel) {
        self.viewModel = content
        viewModel?.willReload = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func collectionViewConstraints(collection: UICollectionView) {
        collection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: horizontalMargin).isActive = true
        collection.widthAnchor.constraint(equalToConstant: self.frame.width - horizontalMargin - horizontalMargin).isActive = true
        collection.heightAnchor.constraint(equalToConstant: self.frame.width * 0.6 ).isActive = true
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCardCollectionViewCell.identifier, for: indexPath) as? WalletCardCollectionViewCell
        else { return UICollectionViewCell() }
        
        if let creditCard = viewModel?.items[indexPath.row].creditCard {
            let cellViewModel = WalletCollectionViewCellViewModel(content: (creditCard), state: .normalCard)
            cellViewModel.isFirst = indexPath.row == 0
            cellViewModel.isLast = indexPath.row == ((viewModel?.items.count ?? 1) - 1)
            cell.configure(with: cellViewModel)
        } else {
            let cellViewModel = WalletCollectionViewCellViewModel(content: nil, state: .addCard)
            cell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 0.631)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel?.getWalletCollectionViewCellViewModel(at: indexPath)?.state == .normalCard {
            if let openDetailsPage = viewModel?.openDetailsPage {
                openDetailsPage(viewModel?.getWalletCollectionViewCellViewModel(at: indexPath))
            }
        }
        if viewModel?.getWalletCollectionViewCellViewModel(at: indexPath)?.state == .addCard {
            if let openAddCardAlert = viewModel?.openAddCardAlert {
                openAddCardAlert()
            }
        }
    }
}
