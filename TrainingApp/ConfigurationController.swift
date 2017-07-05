import UIKit

class ConfigurationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        
        view.addSubview(configureButton)
        setupConfigureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = R.string.localizable.buttonTitleConfig()
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
    }
    
    lazy var configureButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: UIColor.gray, font: UIFont.systemFont(ofSize: 16))
        button.setTitle(R.string.localizable.buttonTitleConfig(), for: UIControlState())
        button.setTitleColor(.white, for: UIControlState())
        button.addTarget(self, action: #selector(tappedConfigButton), for: .touchUpInside)
        return button
    }()
    
    func setupConfigureButton() {
        configureButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        configureButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        configureButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        configureButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func tappedConfigButton() {
        print("go to configure page...")
        let accountConfigController = AccountConfigController()
        let toConfig = UINavigationController(rootViewController: accountConfigController)
        present(toConfig, animated: true, completion: nil)
    }
}
