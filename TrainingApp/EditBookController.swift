//
//  EditBookController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/28.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class EditBookController: UIViewController {
    
    var txtActiveField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(registeredImageView)
        view.addSubview(registerImageButton)
        view.addSubview(bookNameLabel)
        view.addSubview(bookNameTextField)
        view.addSubview(bookPriceLabel)
        view.addSubview(bookPriceTextField)
        view.addSubview(purchaseDateLabel)
        view.addSubview(purchaseDateField)
        setupEditBookViews()
        
        bookNameTextField.delegate = self
        bookPriceTextField.delegate = self
        purchaseDateField.delegate = self
        
        purchaseDateField.inputView = datePicker
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.title = "書籍編集"
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: self, action: #selector(handleBackButton))
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(handleEditFinished))
        
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
        
        if txtLimit >= kbdLimit {
            let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
            UIView.animate(withDuration: duration!, animations: { () in
                let transform = CGAffineTransform(translationX: 0, y: -(64 + txtLimit - kbdLimit))
                self.view.transform = transform
                
                print("テキストフィールドの下辺：(\(txtLimit))")
                print("キーボードの上辺：(\(kbdLimit))")
                print("myBoundSize.height\(myBoundSize.height)")
            })
        }
    }
    
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    func handleStorage() {
        print("handle storage...")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
    
    func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleEditFinished() {
        print("Edit Finished...")
    }
    
    let registeredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var registerImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: .gray, font: UIFont.systemFont(ofSize: 16))
        button.setTitle("画像添付", for: UIControlState())
        button.setTitleColor(.white, for: UIControlState())
        button.addTarget(self, action: #selector(registerImage), for: .touchUpInside)
        return button
    }()
    
    let bookNameLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "書籍名")
        return label
    }()
    
    let bookNameTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let bookPriceLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "金額")
        return label
    }()
    
    let bookPriceTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let purchaseDateLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "購入日")
        return label
    }()
    
    let purchaseDateField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.addTarget(self, action: #selector(changedDateEvent), for: UIControlEvents.valueChanged)
        picker.datePickerMode = UIDatePickerMode.date
        return picker
    }()
    
    func setupEditBookViews() {
            
        registeredImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        registeredImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        registeredImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registeredImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        registerImageButton.leftAnchor.constraint(equalTo: registeredImageView.rightAnchor, constant: 30).isActive = true
        registerImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        registerImageButton.centerYAnchor.constraint(equalTo: registeredImageView.centerYAnchor).isActive = true
        registerImageButton.heightAnchor.constraint(equalTo: registeredImageView.heightAnchor, multiplier: 2/5).isActive = true
        
        bookNameLabel.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        bookNameLabel.topAnchor.constraint(equalTo: registeredImageView.bottomAnchor, constant: 30).isActive = true
        bookNameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        bookNameTextField.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        bookNameTextField.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 2).isActive = true
        bookNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        bookNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bookPriceLabel.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        bookPriceLabel.topAnchor.constraint(equalTo: bookNameTextField.bottomAnchor, constant: 30).isActive = true
        bookPriceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookPriceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        bookPriceTextField.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        bookPriceTextField.topAnchor.constraint(equalTo: bookPriceLabel.bottomAnchor, constant: 2).isActive = true
        bookPriceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        bookPriceTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        purchaseDateLabel.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        purchaseDateLabel.topAnchor.constraint(equalTo: bookPriceTextField.bottomAnchor, constant: 30).isActive = true
        purchaseDateLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        purchaseDateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        purchaseDateField.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        purchaseDateField.topAnchor.constraint(equalTo: purchaseDateLabel.bottomAnchor, constant: 2).isActive = true
        purchaseDateField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        purchaseDateField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

extension EditBookController: UITextFieldDelegate {
    
    func changedDateEvent(sender: UIDatePicker) {
        let dateFormmtter = DateFormatter()
        dateFormmtter.dateFormat = "yyyy/MM/dd"
        purchaseDateField.text = dateFormmtter.string(from: sender.date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.bookNameTextField.isFirstResponder {
            self.bookNameTextField.resignFirstResponder()
        }
        if self.bookPriceTextField.isFirstResponder {
            self.bookPriceTextField.resignFirstResponder()
        }
        if self.purchaseDateField.isFirstResponder {
            self.purchaseDateField.resignFirstResponder()
        }
        
    }

}

extension EditBookController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func registerImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            registeredImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("imagePicker canceled...")
    }
    
}
