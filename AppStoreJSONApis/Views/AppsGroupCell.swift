//
//  AppsGroupCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 09/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    
    var titleLabel: UILabel!
    let horizontalController = AppsHorizontalController()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAppsGroupCellUI()
        
        
    }
    
    fileprivate func setupAppsGroupCellUI() {
        
        
        titleLabel = UILabel(text: "Apps Section", font: .boldSystemFont(ofSize: 30))
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
        }
        
        addSubview(horizontalController.view)
        horizontalController.view.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

