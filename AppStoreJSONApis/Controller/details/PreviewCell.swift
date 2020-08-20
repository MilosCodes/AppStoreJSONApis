//
//  PreviewCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 18/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    let horizontalController = PreviewScreenshotsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .init(white: 0.95, alpha: 0.8)
        
        addSubview(previewLabel)
        previewLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        
        addSubview(horizontalController.view)
        horizontalController.view.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(previewLabel.snp.bottom).offset(5)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
