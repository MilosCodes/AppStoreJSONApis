//
//  AppHeaderAppCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 10/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabeL = UILabel(text: "Facebok", font: .boldSystemFont(ofSize:12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackViewSetup()
    }
    fileprivate func stackViewSetup() {
        
        companyLabeL.textColor = .blue
        titleLabel.numberOfLines = 2
        imageView.backgroundColor = .red
        let stackView = VerticalStackView(arrangedSubviews: [
        companyLabeL, titleLabel, imageView
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
