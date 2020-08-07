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
    
    var appResult: Result! {
        didSet {
            //MARK: - POPULATE OUR CELLS WITH OUR ITUNES API DATA
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Ratings: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
            screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
            screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupSearchResultCellItems()
        
    }
    
    func createScreenShotImageView() -> UIImageView {
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 8
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
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
        getButton.backgroundColor = .lightGray
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 12
        
        appIconImageView = UIImageView()
        appIconImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        appIconImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        appIconImageView.layer.cornerRadius = 12
        appIconImageView.clipsToBounds = true
        
        
    
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
