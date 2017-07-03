import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookListController = BookListController()
        let navigationController = UINavigationController(rootViewController: bookListController)
        bookListController.title = NSLocalizedString("bookListTitle", comment: "")
        navigationController.tabBarItem.image = UIImage(named: viewConstants.tabBarImageBook)
        
        let configurationController = ConfigurationController()
        let secondNavigationController = UINavigationController(rootViewController: configurationController)
        configurationController.title = NSLocalizedString("buttonTitleConfig", comment: "")
        secondNavigationController.tabBarItem.image = UIImage(named: viewConstants.tabBarImageUser)
        
        viewControllers = [navigationController, secondNavigationController]
    }
}
