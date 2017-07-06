import UIKit

class ConfigurationViewController: UIViewController {
    
    lazy var configureButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: .gray, font: .systemFont(ofSize: 16), tite: R.string.localizable.buttonTitleConfig(), tintColor: .white)
        button.addTarget(self, action: #selector(tappedConfigButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
        
        setupConfigureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = R.string.localizable.buttonTitleConfig()
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
    }
    
    func tappedConfigButton() {
        print("go to configure page...")
        let accountConfigViewController = AccountConfigViewController()
        let toConfig = UINavigationController(rootViewController: accountConfigViewController)
        present(toConfig, animated: true, completion: nil)
    }
}

extension ConfigurationViewController {
    func setupConfigureButton() {
        view.addSubview(configureButton)
        configureButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        configureButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        configureButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        configureButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
