//
//  AccountConfigController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/28.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class AccountConfigController: UIViewController, UITextFieldDelegate {
    var txtActiveField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "アカウント設定"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(handleClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(handleStorage))
        
        view.addSubview(emailConfigLabel)
        view.addSubview(emailConfigTextField)
        view.addSubview(passwordConfigLabel)
        view.addSubview(passwordConfigTextField)
        view.addSubview(passwordCheckLabel)
        view.addSubview(passwordCheckTextField)
        setupConfigViews()
        
        
        emailConfigTextField.delegate = self
        passwordConfigTextField.delegate = self
        passwordCheckTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        print(txtLimit >= kbdLimit)
        
        if txtLimit >= kbdLimit {
            let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
            UIView.animate(withDuration: duration!, animations: { () in
                let transform = CGAffineTransform(translationX: 0, y: -(64 + txtLimit - kbdLimit))
                self.view.transform = transform
                
                print("テキストフィールドの下辺：(\(txtLimit))")
                print("キーボードの上辺：(\(kbdLimit))")
            })
        }
    }
    
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.emailConfigTextField.isFirstResponder {
            self.emailConfigTextField.resignFirstResponder()
        }
        if self.passwordConfigTextField.isFirstResponder {
            self.passwordConfigTextField.resignFirstResponder()
        }
        if self.passwordCheckTextField.isFirstResponder {
            self.passwordCheckTextField.resignFirstResponder()
        }
        
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleStorage() {
        
    }
    
    let emailConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "メールアドレス")
        return label
    }()
    
    let emailConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "パスワード")
        return label
    }()
    
    
    let passwordConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordCheckLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "パスワード確認")
        return label
    }()
    
    let passwordCheckTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    func setupConfigViews() {
        
        emailConfigLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailConfigLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 66).isActive = true
        emailConfigLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailConfigLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        emailConfigTextField.leftAnchor.constraint(equalTo: emailConfigLabel.leftAnchor).isActive = true
        emailConfigTextField.topAnchor.constraint(equalTo: emailConfigLabel.bottomAnchor, constant: 2).isActive = true
        emailConfigTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailConfigTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordConfigLabel.leftAnchor.constraint(equalTo: emailConfigLabel.leftAnchor).isActive = true
        passwordConfigLabel.topAnchor.constraint(equalTo: emailConfigTextField.bottomAnchor, constant: 30).isActive = true
        passwordConfigLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordConfigLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        passwordConfigTextField.leftAnchor.constraint(equalTo: emailConfigLabel.leftAnchor).isActive = true
        passwordConfigTextField.topAnchor.constraint(equalTo: passwordConfigLabel.bottomAnchor, constant: 2).isActive = true
        passwordConfigTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordConfigTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordCheckLabel.leftAnchor.constraint(equalTo: emailConfigLabel.leftAnchor).isActive = true
        passwordCheckLabel.topAnchor.constraint(equalTo: passwordConfigTextField.bottomAnchor, constant: 30).isActive = true
        passwordCheckLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordCheckLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        passwordCheckTextField.leftAnchor.constraint(equalTo: emailConfigLabel.leftAnchor).isActive = true
        passwordCheckTextField.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 2).isActive = true
        passwordCheckTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordCheckTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    

}
