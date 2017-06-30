//
//  LoginController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/26.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "書籍一覧"
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        setupLoginViews()
        
    }
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "メールアドレス")
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "パスワード")
        return label
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: UIColor.gray, font: UIFont.systemFont(ofSize: 16))
        button.setTitle("Login", for: UIControlState())
        button.setTitleColor(.white, for: UIControlState())
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    func handleLogin() {
        let tabBarController = TabBarController()
        let navController = UINavigationController(rootViewController: tabBarController)
        present(navController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.emailTextField.isFirstResponder {
            self.emailTextField.resignFirstResponder()
        }
        if self.passwordTextField.isFirstResponder {
            self.passwordTextField.resignFirstResponder()
        }
        
    }
    
    func setupLoginViews() {
        
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 94).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordLabel.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
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
