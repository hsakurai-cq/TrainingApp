import UIKit
import APIKit
import Himotoki

class LoginViewController: UIViewController {
    
    //UI部品設定
    let emailLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleEmail(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePassword(), font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: .gray, font: .systemFont(ofSize: 16), tite: R.string.localizable.buttonTitleLogin(), tintColor: .white)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.string.localizable.bookListTitle()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        setupLoginViews()
        
    }
    
    func tappedLoginButton() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let validateResult = Validate.login(email: email, password: password)
        guard validateResult.result else {
            return UIAlertController.showAlert(error: validateResult.error, view: self)
        }
        let request = LoginRequest(email: email, password: password)
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

extension LoginViewController: UITextFieldDelegate {
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
}

//Anchor設定
extension LoginViewController {
    func setupLoginViews() {
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
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
