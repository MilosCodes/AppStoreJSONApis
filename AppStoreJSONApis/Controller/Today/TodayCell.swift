//
//  TodayCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 24/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class TodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            imageView.image = todayItem?.image
            descriptionLabel.text = todayItem?.description
        }
    }
    let categoryLabel = UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    let titleLabel = UILabel(text: "Utilizing your time", font: .boldSystemFont(ofSize: 26), numberOfLines: 2)
    
    let imageView = UIImageView(image: UIImage.init(named: "garden"))
    
    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way.", font: .boldSystemFont(ofSize: 16), numberOfLines: 3)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 240, height: 240))
        
        let stackView = VerticalStackView(arrangedSubviews: [
        categoryLabel,
        titleLabel,
        imageContainerView,
        descriptionLabel
        ], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
