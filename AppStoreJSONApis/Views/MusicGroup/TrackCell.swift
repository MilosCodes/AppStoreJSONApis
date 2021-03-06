//
//  TrackCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 9/7/20.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class TrackCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Track Name", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
    let subtitleLabel = UILabel(text: "Subtitle Label", font: .systemFont(ofSize: 16), numberOfLines: 2)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage.init(named: "garden")
        imageView.constrainWidth(constant: 80)
     let stackView = UIStackView(arrangedSubviews: [
              imageView,
              VerticalStackView(arrangedSubviews: [
              nameLabel,
              subtitleLabel
              ], spacing: 4)
     ], customSpacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        stackView.alignment = .center
        
        }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
