//
//  VerticalStackView.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 05/08/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.axis = .vertical
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
