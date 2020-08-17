//
//  AppDetailCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 16/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppDetailCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? "" ))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let priceButton = UIButton(title: "$4.99")
    
    let whatsNewLabel = UILabel(text: "Whats new", font: .boldSystemFont(ofSize: 20), numberOfLines: 20)
    
    let releaseNotesLabel = UILabel(text: "Release Note", font: .boldSystemFont(ofSize: 16), numberOfLines: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        appIconImageView.backgroundColor = .red
        appIconImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        appIconImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        priceButton.backgroundColor = UIColor.init(red: 28/255, green: 108/255, blue: 235/255, alpha: 1)
        priceButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        priceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.tintColor = .white
        let stackView = VerticalStackView(arrangedSubviews: [
        UIStackView(arrangedSubviews: [appIconImageView,
            VerticalStackView(arrangedSubviews: [
            nameLabel,
            UIStackView(arrangedSubviews: [priceButton, UIView()])
            ], spacing: 12)
        ], customSpacing: 20), whatsNewLabel, releaseNotesLabel
        ], spacing: 16)
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.bottom.right.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


