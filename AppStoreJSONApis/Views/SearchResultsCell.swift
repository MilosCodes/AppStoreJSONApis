//
//  SearchResultsCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 19/05/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit
import SnapKit


class SearchResultCell: UICollectionViewCell {
    
    var appIconImageView: UIImageView!
    var getButton: UIButton!
    var nameLabel: UILabel!
    var ratingsLabel: UILabel!
    var categoryLabel: UILabel!
    
    lazy var screenshot1ImageView = self.createScreenShotImageView()
    lazy var screenshot2ImageView = self.createScreenShotImageView()
    lazy var screenshot3ImageView = self.createScreenShotImageView()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        setupSearchResultCellItems()
        
    }
    
    func createScreenShotImageView() -> UIImageView {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    
    private func setupSearchResultCellItems() {
        nameLabel = UILabel()
        nameLabel.text = "App Here"
        nameLabel.setupLabel()
        
        categoryLabel = UILabel()
        categoryLabel.text = "Category"
        categoryLabel.setupLabel()
        
        ratingsLabel = UILabel()
        ratingsLabel.text = "Ratings"
        ratingsLabel.setupLabel()
        
        getButton = UIButton(type: .system)
        getButton.setTitle("Get", for: .normal)
        getButton.setTitleColor(.blue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.backgroundColor = .darkGray
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 12
        
        appIconImageView = UIImageView()
        appIconImageView.backgroundColor = .red
        appIconImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        appIconImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        appIconImageView.layer.cornerRadius = 12
        
        
    
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel,
                categoryLabel,
                ratingsLabel
            
            ]),
            getButton
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [
        screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
        ])
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
     
       let overallStackView = VerticalStackView(arrangedSubviews: [
        infoTopStackView, screenShotsStackView
        ], spacing: 16)
        addSubview(overallStackView)
        
        overallStackView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().offset(-16)
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UILabel {
    
    func setupLabel() {
        self.font =  UIFont.boldSystemFont(ofSize: 15)
        self.textColor =  .black
        
    }
}
