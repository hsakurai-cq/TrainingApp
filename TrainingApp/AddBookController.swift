import UIKit

class AddBookController: UIViewController {
    
    var txtActiveField = UITextField()
    
    //UI部品設定
    let registeredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let registerImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: .gray, font: .systemFont(ofSize: 16), tite: R.string.localizable.buttonTitleSetImage(), tintColor: .white)
        button.addTarget(self, action: #selector(registerImage), for: .touchUpInside)
        return button
    }()
    
    let bookNameLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleBook(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    let bookNameTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let bookPriceLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePrice(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    let bookPriceTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.keyboardType = .numberPad
        return tf
    }()
    
    let purchaseDateLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePurchaseDate(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    let purchaseDateField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
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
        navigationItem.title = R.string.localizable.addBookTitle()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleClose(), style: .plain, target: self, action: #selector(tappedCloseButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleSave(), style: .plain, target: self, action: #selector(tappedSaveButton))
        navigationController?.navigationBar.isTranslucent = false
        
        setupAddBookViews()
        
        bookNameTextField.delegate = self
        bookPriceTextField.delegate = self
        purchaseDateField.delegate = self
        purchaseDateField.inputView = datePicker
    }
    
    //ここからキーボードの高さ変更処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    //キーボードの高さ処理終了
    
    func tappedCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func tappedSaveButton() {
        print("save book...")
    }
    
}

extension AddBookController: UITextFieldDelegate {
   
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
}

extension AddBookController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func registerImage() {
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

//Ancho設定
extension AddBookController {
    func setupAddBookViews() {
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
        purchaseDateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        purchaseDateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        purchaseDateField.leftAnchor.constraint(equalTo: registeredImageView.leftAnchor).isActive = true
        purchaseDateField.topAnchor.constraint(equalTo: purchaseDateLabel.bottomAnchor, constant: 2).isActive = true
        purchaseDateField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        purchaseDateField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
