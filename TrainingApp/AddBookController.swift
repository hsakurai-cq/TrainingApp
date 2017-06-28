//
//  AddBookController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/27.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class AddBookController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIToolbarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var toolBar: UIToolbar!    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "書籍追加"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(handleClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(handleStorage))
        
        view.addSubview(registeredImageView)
        view.addSubview(registerImageButton)
        view.addSubview(bookNameLabel)
        view.addSubview(bookNameTextField)
        view.addSubview(bookPriceLabel)
        view.addSubview(bookPriceTextField)
        view.addSubview(purchaseDateLabel)
        view.addSubview(purchaseDateField)
        setupAddBookViews()
        
        purchaseDateField.inputView = datePicker
        toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.size.height / 6, width: view.frame.size.width, height: 40))
        toolBar.layer.position = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height - 20)
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(tappedToolBarBtn))
        toolBar.items = [toolBarBtn]
        purchaseDateField.inputAccessoryView = toolBar
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleStorage() {
        
    }
    
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
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        purchaseDateField.resignFirstResponder()
        
    }
    
    func changedDateEvent(sender: UIDatePicker) {
        let dateFormmtter = DateFormatter()
        dateFormmtter.dateFormat = "yyyy/MM/dd"
        purchaseDateField.text = dateFormmtter.string(from: sender.date)
    }
    
    let registeredImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "book_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var registerImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("画像添付", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(registerImage), for: .touchUpInside)
        return button
    }()
    
    let bookNameLabel: UILabel = {
        let label = UILabel()
        label.text = "書籍名"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let bookNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.blue
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let bookPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "金額"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let bookPriceTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.blue
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let purchaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "購入日"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let purchaseDateField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.blue
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.addTarget(self, action: #selector(changedDateEvent), for: UIControlEvents.valueChanged)
        picker.datePickerMode = UIDatePickerMode.date
        return picker
    }()
    
    func setupAddBookViews() {
        
        registeredImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        registeredImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 94).isActive = true
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










