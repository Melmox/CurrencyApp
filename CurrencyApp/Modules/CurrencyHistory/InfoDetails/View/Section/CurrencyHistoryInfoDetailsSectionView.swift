//
//  CurrencyHistoryInfoDetailsSectionView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 29.03.2023.
//

import UIKit

final class CurrencyHistoryInfoDetailsSectionView: BasicTableViewHeaderFooterView<CurrencyHistoryInfoDetailsSectionHeader> {
    
    // MARK: - Properties
    // MARK: Content
    static let identifier = String(describing: CurrencyHistoryInfoDetailsSectionView.self)
    var sectionHeaderButton = UIButton()
    
    // MARK: Callbacks:
    
    var didSelect: emptyClosure?
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        sectionHeaderButton.setTitle(nil, for: .normal)
        didSelect = nil
    }
    
    //MARK: - View
    //MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        contentView.addSubview(sectionHeaderButton)
        
        sectionHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        
        sectionHeaderButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        sectionHeaderButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        sectionHeaderButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
        sectionHeaderButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        
        sectionHeaderButton.backgroundColor = .systemGray
        sectionHeaderButton.setTitleColor(.white, for: .normal)
        sectionHeaderButton.semanticContentAttribute = .forceRightToLeft
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        updateSelectedState()
    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    override func configure(with viewModel: CurrencyHistoryInfoDetailsSectionHeader) {
        super.configure(with: viewModel)
        
        sectionHeaderButton.setTitle(viewModel.title, for: .normal)
        sectionHeaderButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        if sectionHeaderButton.currentTitle != "" {
            sectionHeaderButton.setImage(UIImage(systemName: "chevron.down")?
                .withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    private func updateSelectedState() {
        viewModel?.updateSelectedState()
        didSelect?()
    }
}
