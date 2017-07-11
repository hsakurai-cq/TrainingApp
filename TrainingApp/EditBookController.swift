import UIKit
import Kingfisher
import APIKit
import Himotoki

class EditBookViewController: UIViewController {
    
    var book: Book!
    var txtActiveField = UITextField()
    
    //UI部品設定
    lazy var registeredImageView: UIImageView = {
        let imageView = UIImageView()
        let imageURL = URL(string: self.book.imageData)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: imageURL)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let registerImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: .gray, font: .systemFont(ofSize: 16), tite: R.string.localizable.buttonTitleSetImage(), tintColor: .white)
        button.addTarget(self, action: #selector(tappedRegisterImageButton), for: .touchUpInside)
        return button
    }()
    
    let bookNameLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text:  R.string.localizable.labelTitleBook(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    lazy var bookNameTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.text = self.book.name
        return tf
    }()
    
    let bookPriceLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePrice(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    lazy var bookPriceTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.text = "\(self.book.price)"
        tf.keyboardType = UIKeyboardType.numberPad
        return tf
    }()
    
    let purchaseDateLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePurchaseDate(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    lazy var purchaseDateField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.text = Date.formatConverter(dateString: self.book.purchaseDate)
        return tf
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.addTarget(self, action: #selector(changedDateEvent), for: .valueChanged)
        picker.datePickerMode = .date
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        setupEditBookViews()
        
        bookNameTextField.delegate = self
        bookPriceTextField.delegate = self
        purchaseDateField.delegate = self
        purchaseDateField.inputView = datePicker
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.title = R.string.localizable.editBookTitle()
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleBack(), style: .plain, target: self, action: #selector(tappedBackButton))
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleSave(), style: .plain, target: self, action: #selector(tappedEditButton))
        
        //以下、キーボード高さ変更処理
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShowNotification(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize = UIScreen.main.bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        if txtLimit >= kbdLimit {
            let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
            UIView.animate(withDuration: duration!) { () in
                let transform = CGAffineTransform(translationX: 0, y: -(64 + txtLimit - kbdLimit))
                self.view.transform = transform
            }
        }
    }
    
    func keyboardWillHideNotification(_ notification: Notification) {
        let duration: TimeInterval? = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) { () in
            self.view.transform = CGAffineTransform.identity
        }
    }
    //キーボード高さ変更処理終了
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedEditButton() {
        let id = book.id
        let name = bookNameTextField.text!
        let price = Int(bookPriceTextField.text!)
        let purchaseDate = purchaseDateField.text!
        let data: NSData? = UIImagePNGRepresentation(registeredImageView.image!) as NSData?
        let encodedString = data?.base64EncodedString(options: [])
        let request = EditBookRequest(bookId: id, name: name, price: price!, purchaseDate: purchaseDate, imageData: encodedString!)
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
                print("Edit Finished...")
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension EditBookViewController: UITextFieldDelegate {
    
    func changedDateEvent(sender: UIDatePicker) {
        purchaseDateField.text = Date.toString(sender: sender)
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

extension EditBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func tappedRegisterImageButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        if let originalImage = info[Constants.InfoOfImagePicker] as? UIImage {
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

//Anchor設定
extension EditBookViewController {
        func setupEditBookViews() {
        view.addSubview(registeredImageView)
        view.addSubview(registerImageButton)
        view.addSubview(bookNameLabel)
        view.addSubview(bookNameTextField)
        view.addSubview(bookPriceLabel)
        view.addSubview(bookPriceTextField)
        view.addSubview(purchaseDateLabel)
        view.addSubview(purchaseDateField)
        
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
