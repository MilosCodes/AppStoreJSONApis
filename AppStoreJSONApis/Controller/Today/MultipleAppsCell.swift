//
//  MultipleAppsCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 8/31/20.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class MultipleAppsCell: UICollectionViewCell {
    var app : FeedResult! {
        didSet {
            nameLabel.text = app.name
            companyNameLabel.text = app.artistName
            imageView.sd_setImage(with: URL(string: app.artworkUrl100))
        }
    }
    
    var whiteView: UIView!
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var companyNameLabel: UILabel!
    var getButton: UIButton!
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupAppsRowCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupAppsRowCellUI() {
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
        addSubview(whiteView)
        
        imageView = UIImageView(cornerRadius: 8)
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 54).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        nameLabel = UILabel(text: "Name of the App", font: .boldSystemFont(ofSize: 20), numberOfLines: 0)
        nameLabel.textColor = .black
        
        companyNameLabel = UILabel(text: "Company Name", font: .boldSystemFont(ofSize: 13), numberOfLines: 0)
        companyNameLabel.textColor = .black
        
        getButton = UIButton(title: "GET")
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 32 / 2
        
        
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyNameLabel], spacing: 4), getButton
        ])
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        whiteView.addSubview(stackView)
        
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: nameLabel.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0), size:  .init(width: 0, height: 0.5))
        
        stackView.spacing = 16
        stackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
        
        whiteView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
