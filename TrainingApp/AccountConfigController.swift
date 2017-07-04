import UIKit

class AccountConfigController: UIViewController, UITextFieldDelegate {
    var txtActiveField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let userDefault = UserDefaults.standard
//        let dict = ["firstLaunch": true]
//        userDefault.register(defaults: dict)
//        if userDefault.bool(forKey: "firstLaunch") {
//            userDefault.set(false, forKey: "firstLaunch")
//            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//            print("初回起動2")
//        } else {
//            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(handleClose))
//        }
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = R.string.localizable.accountConfigTitle()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleClose(), style: .plain, target: self, action: #selector(handleModalClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleSave(), style: .plain, target: self, action: #selector(handleSaveAccount))
        
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
    
    func handleModalClose() {
        print("close...")
        dismiss(animated: true, completion: nil)
    }
    
    func handleSaveAccount() {
        print("save account...")
    }
    
    let emailConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleEmail())
        return label
    }()
    
    let emailConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePassword())
        return label
    }()
    
    let passwordConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let passwordCheckLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleConfPass())
        return label
    }()
    
    let passwordCheckTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    func setupConfigViews() {
        
        emailConfigLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailConfigLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58).isActive = true
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
