//
//  AppRowCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 09/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppsRowCell: UICollectionViewCell {
    
    var whiteView: UIView!
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var companyNameLabel: UILabel!
    var getButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupAppsRowCellUI()
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


