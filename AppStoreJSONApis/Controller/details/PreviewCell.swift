//
//  PreviewCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 18/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
