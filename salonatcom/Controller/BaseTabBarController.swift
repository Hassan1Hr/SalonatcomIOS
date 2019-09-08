//
//  BaseTabBarController.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/16/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: viewSalonat(), title: "الصالونات", imageName: "First"),
            createNavController(viewController: AppsSearchController(), title: "الخدمات", imageName: "Second"),
            createNavController(viewController: profileViewController(), title: "صفحتي", imageName:
                "Four"),
            createNavController(viewController: UIViewController(), title: "closer", imageName: "Third")
        ]
        
    }
    func createNavController(viewController : UIViewController , title : String , imageName : String)-> UIViewController{
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
    
  
}
