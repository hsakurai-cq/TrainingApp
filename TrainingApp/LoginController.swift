import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.string.localizable.bookListTitle()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        setupLoginViews()
    }
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitleEmail())
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textFieldConfig()
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: R.string.localizable.labelTitlePassword())
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
        button.buttonConfig(backgroundColor: UIColor.gray, font: UIFont.systemFont(ofSize: 16))
        button.setTitle(R.string.localizable.buttonTitleLogin(), for: UIControlState())
        button.setTitleColor(.white, for: UIControlState())
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    func login() {
        let tabBarController = TabBarController()
        let navController = UINavigationController(rootViewController: tabBarController)
        present(navController, animated: true, completion: nil)
    }
    
}

extension LoginController: UITextFieldDelegate {
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
extension LoginController {
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
