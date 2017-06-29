//
//  LoginController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/26.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "書籍一覧"
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.green
        
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        setupLoginViews()
        
    }
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "メールアドレス"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "email"
        tf.backgroundColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "パスワード"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Login", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    func handleLogin() {
        let tabBarController = TabBarController()
        let navController = UINavigationController(rootViewController: tabBarController)
        //navigationController?.pushViewController(navController, animated: true)
        present(navController, animated: true, completion: nil)
    }
    
    func setupLoginViews() {
        
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 94).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordLabel.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 54).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 59).isActive = true
    }
    
    
    
    
    
}












