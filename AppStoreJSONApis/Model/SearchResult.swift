//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 06/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    var trackId: Int?
    var trackName: String?
    let primaryGenreName: String
    var averageUserRating: Float?
    var screenshotUrls: [String]?
    let artworkUrl100: String  //MARK: - App Icon
    var formattedPrice: String?
    var description: String?
    var releaseNotes: String?
    var artistName: String?
    var collectionName: String?
}
