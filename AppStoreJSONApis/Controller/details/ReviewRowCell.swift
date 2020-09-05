//
//  ReviewRowCell.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 20/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit




import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
