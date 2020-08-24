//
//  TodayCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 24/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage.init(named: "garden"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
