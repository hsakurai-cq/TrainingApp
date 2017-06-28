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
        
        self.tabBarController?.navigationItem.title = "設定"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.blue
        
        view.addSubview(configureButton)
        setupConfigureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "設定"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    lazy var configureButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("アカウント設定", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleConfig), for: .touchUpInside)
        return button
    }()
    
    func setupConfigureButton() {
        configureButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        configureButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        configureButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        configureButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func handleConfig() {
        print("go to configure page...")
        let accountConfigController = AccountConfigController()
        let toConfig = UINavigationController(rootViewController: accountConfigController)
        present(toConfig, animated: true, completion: nil)
    }
}
