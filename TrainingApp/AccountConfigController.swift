import UIKit
import APIKit
import Himotoki

class AccountConfigViewController: UIViewController, UITextFieldDelegate {
    
    fileprivate var txtActiveField = UITextField()
    
    //UI部品設定
    fileprivate let emailConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleEmail(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    fileprivate let emailConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    fileprivate let passwordConfigLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePassword(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    fileprivate let passwordConfigTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    fileprivate let passwordCheckLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleConfPass(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    fileprivate let passwordCheckTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.isSecureTextEntry = true
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        let dict = ["firstLaunch": true]
        userDefault.register(defaults: dict)
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: R.string.localizable.buttonTitleNil(),
                style: .plain,
                target: self,
                action: nil
            )
            print("初回起動(アカウント設定画面)")
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem (
                                                    title: R.string.localizable.buttonTitleClose(),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(tappedCloseButton)
                                                )
        }
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = R.string.localizable.accountConfigTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem (
                                                title: R.string.localizable.buttonTitleSave(),
                                                style: .plain,
                                                target: self,
                                                action: #selector(tappedSaveButton)
                                            )
        
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
    
    func tappedCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func tappedSaveButton() {
        let email = emailConfigTextField.text!
        let password = passwordConfigTextField.text!
        let passwordCheck = passwordCheckTextField.text!
        let validateResult = Validate.signUp(email: email, password: password, passwordCheck: passwordCheck)
        guard validateResult.result else {
            return UIAlertController.showAlert(error: validateResult.error, view: self)
        }
        let request = SingUpRequest(email: email, password: password)
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
                let userDefault = UserDefaults.standard
                userDefault.set(response.id, forKey: "user_id")
                userDefault.set(response.token, forKey: "request_token")
                let tabBarController = TabBarController()
                let navController = UINavigationController(rootViewController: tabBarController)
                self.present(navController, animated: true, completion: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//Anchor設定
extension AccountConfigViewController {
    fileprivate func setupConfigViews() {
        view.addSubview(emailConfigLabel)
        view.addSubview(emailConfigTextField)
        view.addSubview(passwordConfigLabel)
        view.addSubview(passwordConfigTextField)
        view.addSubview(passwordCheckLabel)
        view.addSubview(passwordCheckTextField)
        
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
