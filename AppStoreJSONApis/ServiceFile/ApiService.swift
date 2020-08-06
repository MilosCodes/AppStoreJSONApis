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
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ())  {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        
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
}
