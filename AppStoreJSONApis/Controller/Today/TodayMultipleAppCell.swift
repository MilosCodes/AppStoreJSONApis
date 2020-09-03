//
//  TodayMultipleAppCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 8/31/20.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            
            multipleAppsController.apps = todayItem.apps
            multipleAppsController.collectionView.reloadData()
        }
    }
    let categoryLabel = UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    let titleLabel = UILabel(text: "Utilizing your time", font: .boldSystemFont(ofSize: 32), numberOfLines: 2)
    
    let multipleAppsController = TodayMultipleAppsController(mode: .small)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        
        
        let stackView = VerticalStackView(arrangedSubviews: [
        categoryLabel,
        titleLabel,
        multipleAppsController.view
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
