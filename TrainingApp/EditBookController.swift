//
//  EditBookController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/28.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class EditBookController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIToolbarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var toolBar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        self.tabBarController?.navigationItem.title = "書籍編集"
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: self, action: #selector(handleBackButton))
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(handleEditFinished))
        
        view.addSubview(editedImageView)
        view.addSubview(editImageButton)
        view.addSubview(editBookNameLabel)
        view.addSubview(editBookNameTextField)
        view.addSubview(editBookPriceLabel)
        view.addSubview(editBookPriceTextField)
        view.addSubview(editPurchaseDateLabel)
        view.addSubview(editPurchaseDateField)
        setupEditBookViews()
        
        editPurchaseDateField.inputView = datePicker
        toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.size.height / 6, width: view.frame.size.width, height: 40))
        toolBar.layer.position = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height - 20)
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(tappedToolBarBtn))
        toolBar.items = [toolBarBtn]
        editPurchaseDateField.inputAccessoryView = toolBar
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
            editedImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePicker canceled...")
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        editPurchaseDateField.resignFirstResponder()
        
    }
    
    func changedDateEvent(sender: UIDatePicker) {
        let dateFormmtter = DateFormatter()
        dateFormmtter.dateFormat = "yyyy/MM/dd"
        editPurchaseDateField.text = dateFormmtter.string(from: sender.date)
    }
    
    func handleBackButton() {
        
        navigationController?.popViewController(animated: true)
    }
    
    func handleEditFinished() {
        print("Edit Finished...")
    }
    
    let editedImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "book_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let editImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("画像添付", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(registerImage), for: .touchUpInside)
        return button
    }()
    
    let editBookNameLabel: UILabel = {
        let label = UILabel()
        label.text = "書籍名"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let editBookNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.blue
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let editBookPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "金額"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let editBookPriceTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.blue
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let editPurchaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "購入日"
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let editPurchaseDateField: UITextField = {
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
    
    func setupEditBookViews() {
        
        editedImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        editedImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        editedImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        editedImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        editImageButton.leftAnchor.constraint(equalTo: editedImageView.rightAnchor, constant: 30).isActive = true
        editImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        editImageButton.centerYAnchor.constraint(equalTo: editedImageView.centerYAnchor).isActive = true
        editImageButton.heightAnchor.constraint(equalTo: editedImageView.heightAnchor, multiplier: 2/5).isActive = true
        
        editBookNameLabel.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editBookNameLabel.topAnchor.constraint(equalTo: editedImageView.bottomAnchor, constant: 30).isActive = true
        editBookNameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        editBookNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        editBookNameTextField.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editBookNameTextField.topAnchor.constraint(equalTo: editBookNameLabel.bottomAnchor, constant: 2).isActive = true
        editBookNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        editBookNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        editBookPriceLabel.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editBookPriceLabel.topAnchor.constraint(equalTo: editBookNameTextField.bottomAnchor, constant: 30).isActive = true
        editBookPriceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        editBookPriceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        editBookPriceTextField.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editBookPriceTextField.topAnchor.constraint(equalTo: editBookPriceLabel.bottomAnchor, constant: 2).isActive = true
        editBookPriceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        editBookPriceTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        editPurchaseDateLabel.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editPurchaseDateLabel.topAnchor.constraint(equalTo: editBookPriceTextField.bottomAnchor, constant: 30).isActive = true
        editPurchaseDateLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        editPurchaseDateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        editPurchaseDateField.leftAnchor.constraint(equalTo: editedImageView.leftAnchor).isActive = true
        editPurchaseDateField.topAnchor.constraint(equalTo: editPurchaseDateLabel.bottomAnchor, constant: 2).isActive = true
        editPurchaseDateField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        editPurchaseDateField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
