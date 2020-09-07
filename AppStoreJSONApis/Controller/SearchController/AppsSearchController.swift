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


class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var enterSearchTermlabel: UILabel!
    
    
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = String(appResults[indexPath.item].trackId!)
        let appDetailController = AppDetailController(appId: appId)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: appSearchCellId)
        
        searchLabelUI()
        setupSearchBar()
        fetchItunesApps()
        
    }
    
    fileprivate func searchLabelUI() {
        
        enterSearchTermlabel = UILabel()
        enterSearchTermlabel.text = "please enter search term above..."
        enterSearchTermlabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(enterSearchTermlabel)
        
        enterSearchTermlabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - THrottling the search
    var timer: Timer?
    fileprivate func setupSearchBar() {
        //MARK: - UISearchBarDelegate in class to inherit
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            //MARK: - Fire my search
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                
                if let err = err {
                    print("failed to fetch apps", err)
                    return
                }
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    fileprivate var appResults = [Result]()
    
    //MARK: - Extract this function fetchItunesApps() outside of this controller file
    
    
    //MARK: - FetchingItunesApp()
    fileprivate func fetchItunesApps() {
        Service.shared.fetchApps(searchTerm: "twitter") { (res, err) in
            
            if let err = err {
                print("failed to fetch apps:",err)
                return
            }
            self.appResults = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
    //MARK: - NumberOfItemsInSection & CellForItemAt
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermlabel.isHidden = appResults.count != 0
        return appResults.count }
    
    
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
    
}
