//
//  BackEnableNavigationController.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 9/3/20.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
