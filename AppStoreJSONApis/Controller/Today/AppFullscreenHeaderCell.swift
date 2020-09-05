//
//  AppFullscreenHeaderCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 25/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
