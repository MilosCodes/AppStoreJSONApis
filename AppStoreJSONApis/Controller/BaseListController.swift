//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 08/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit



class BaseListController: UICollectionViewController {
     
    
  //MARK: - Initilazation of UICollectionViewFlowLayout -- DO NOT FORGET THIS IS IMPORTANT it allows you to create Controller without any params
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
