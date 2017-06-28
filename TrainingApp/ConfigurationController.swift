//
//  ConfigurationController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/26.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class ConfigurationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "設定"
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        view.backgroundColor = UIColor.blue
    }
        
}
