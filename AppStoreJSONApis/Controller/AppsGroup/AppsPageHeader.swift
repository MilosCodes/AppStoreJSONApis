//
//  AppsPageHeader.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 10/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppsPageHeader: UICollectionReusableView {
    
    
    let appheaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        appheaderHorizontalController.view.backgroundColor = .purple
        addSubview(appheaderHorizontalController.view)
        
        appheaderHorizontalController.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
