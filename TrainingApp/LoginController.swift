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
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        view.addSubview(loginButton)
        
        setupTopContainerView()
        setupBottomContainerView()
        setupLoginButton()
    }
    
    let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "メールアドレス"
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.textColor = .white
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "パスワード"
        label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        label.textColor = .white
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "password"
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
        present(navController, animated: true, completion: nil)
    }
    
    var topContainerViewHeightAnchor: NSLayoutConstraint?
    var emailLabelHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var bottomContainerViewHeightAnchor: NSLayoutConstraint?
    var passwordLabelHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupTopContainerView() {
        
        topContainerView.addSubview(emailLabel)
        topContainerView.addSubview(emailTextField)
        
        topContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120).isActive = true
        topContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        topContainerViewHeightAnchor = topContainerView.heightAnchor.constraint(equalToConstant: 60)
        topContainerViewHeightAnchor?.isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: topContainerView.leftAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor).isActive = true
        emailLabelHeightAnchor = emailLabel.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 2/7)
        emailLabelHeightAnchor?.isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: topContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: topContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 5/7)
        emailTextFieldHeightAnchor?.isActive = true
    }
    
    func setupBottomContainerView() {
        
        bottomContainerView.addSubview(passwordLabel)
        bottomContainerView.addSubview(passwordTextField)
        
        bottomContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 12).isActive = true
        bottomContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        bottomContainerViewHeightAnchor = bottomContainerView.heightAnchor.constraint(equalToConstant: 60)
        bottomContainerViewHeightAnchor?.isActive = true
        
        passwordLabel.leftAnchor.constraint(equalTo: topContainerView.leftAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor).isActive = true
        passwordLabelHeightAnchor = passwordLabel.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 2/7)
        passwordLabelHeightAnchor?.isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor).isActive = true
        passwordLabelHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 5/7)
        passwordLabelHeightAnchor?.isActive = true
        
    }
    
    func setupLoginButton() {
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    
}












