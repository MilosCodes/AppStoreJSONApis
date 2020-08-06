//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 19/05/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit
import SDWebImage

fileprivate let appSearchCellId = "appSearchCellId"


class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: appSearchCellId)
        fetchItunesApps()
    }
    
    
    fileprivate var appResults = [Result]()
    
    //MARK: - Extract this function fetchItunesApps() outside of this controller file
    
    
    //MARK: - FetchingItunesApp()
    fileprivate func fetchItunesApps() {
        Service.shared.fetchApps { (res, err) in
            
            if let err = err {
                print("failed to fetch apps:",err)
                return
            }
            self.appResults = res
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
    //MARK: - NumberOfItemsInSection & CellForItemAt
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return appResults.count }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appSearchCellId, for: indexPath) as! SearchResultCell
        let appResult = appResults[indexPath.row]
        cell.appResult = appResult
        return cell
    }
    
    //MARK: - sizeForItem
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    
    //MARK: - Initilazation of UICollectionViewFlowLayout -- DO NOT FORGET THIS IS IMPORTANT
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
