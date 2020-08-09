//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Milos Milivojevic on 19/05/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppsController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
            
            
        ]
        

    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}


//if you want to do it programbatically you can do like this.

class YourClassName: UIViewController {
    
    var button: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonSubviewAndUI()
    }

fileprivate func addButtonSubviewAndUI() {
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.titleLabel?.numberOfLines = 0
    button.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 20)
    button.setTitle("Type some really really long title", for: .normal)
    view.addSubview(button)
    
    // ADD CONSTRAINTS
    button.snp.makeConstraints { (make) in
        make.width.height.equalTo(40)
        make.center.equalToSuperview()
    }
  }
}
