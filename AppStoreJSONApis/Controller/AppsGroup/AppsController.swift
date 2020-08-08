//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 08/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class AppsController: BaseListController {
    
let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK: - Number of Items in Section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 5 }
    
    //MARK: - Cell for item
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
    
}

//MARK: - Making Cell Bigger and Wider.
extension AppsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
