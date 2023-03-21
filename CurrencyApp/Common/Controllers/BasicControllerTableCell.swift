//
//  BasicControllerTableCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation
import UIKit

protocol BasicControllerUITableViewCell {
    func configure()
}

class BasicControllerTableCell<TableViewCell: BasicControllerUITableViewCell>: UITableViewCell {
    
//    private(set) var myItem : CGRect
//
//
//    override init(frame: CGRect) {
//        self.myItem = frame
//        super.init(frame: myItem)
//    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func prepareForReuse() {
//        <#code#>
    }
    
}
