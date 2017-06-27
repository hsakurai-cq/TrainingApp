//
//  ViewController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/26.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookListController = BookListController()
        let navigationController = UINavigationController(rootViewController: bookListController)
        navigationController.title = "書籍一覧"
        navigationController.tabBarItem.image = UIImage(named: "book_icon")
        
        let configurationController = ConfigurationController()
        let secondNavigationController = UINavigationController(rootViewController: configurationController)
        secondNavigationController.title = "設定"
        secondNavigationController.tabBarItem.image = UIImage(named: "user_icon")
        
        viewControllers = [navigationController, secondNavigationController]
    }

   
}
