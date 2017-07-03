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
        self.tabBarController?.navigationItem.title = viewConstants.buttonTitleConfig
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewConstants.buttonTitleNil, style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: viewConstants.buttonTitleNil, style: .plain, target: self, action: nil)
    }
    
    lazy var configureButton: UIButton = {
        let button = UIButton(type: .system)
        button.buttonConfig(backgroundColor: UIColor.gray, font: UIFont.systemFont(ofSize: 16))
        button.setTitle(viewConstants.buttonTitleConfig, for: UIControlState())
        button.setTitleColor(.white, for: UIControlState())
        button.addTarget(self, action: #selector(handleTapConfig), for: .touchUpInside)
        return button
    }()
    
    func setupConfigureButton() {
        configureButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        configureButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        configureButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        configureButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func handleTapConfig() {
        print("go to configure page...")
        let accountConfigController = AccountConfigController()
        let toConfig = UINavigationController(rootViewController: accountConfigController)
        present(toConfig, animated: true, completion: nil)
    }
}
