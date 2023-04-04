//
//  BasicControllerCollectionViewCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 17.03.2023.
//

import Foundation
import UIKit

protocol BasicControllerCollectionViewItemModel {
    func configure()
}

class BasicControllerCollectionViewCell<CollectionViewCell: BasicControllerCollectionViewItemModel>: UICollectionViewCell {
    
    private(set) var myItem : CGRect
    
    
    override init(frame: CGRect) {
        self.myItem = frame
        super.init(frame: myItem)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func prepareForReuse() {
//        <#code#>
    }
    
}
