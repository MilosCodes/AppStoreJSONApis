//
//  ApiService.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 06/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import Foundation


class Service {
    
    static let shared = Service() // Singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ())  {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        // fetch data from internet
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            //if error fetch
            
            if let err = err {
                print("failed to fetch apps", err)
                completion([], nil)
            }
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
                
                
            }
            catch let jsonErr {
                print("Failed to decode JSONN", jsonErr)
                completion([], jsonErr)
            }
            
            
        }.resume() //fires off the request
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
                return
                
            }
            do {
                
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)

                //success case
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
            } catch let jsonAppGroupErr {
                completion(nil, jsonAppGroupErr)
            }
        }.resume()
    }
}
