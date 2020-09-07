//
//  MusicLoadingFooter.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 9/7/20.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class MusicLoadingFooter: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        addSubview(aiv)
        
        let label = UILabel(text: "Lading more...", font: .systemFont(ofSize: 16), numberOfLines: 0)
        label.textAlignment = .center
        let stackView = VerticalStackView(arrangedSubviews: [
        aiv,label
        ], spacing: 8)
        
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
