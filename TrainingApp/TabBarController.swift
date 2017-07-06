import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookListVIewController = BookListViewController()
        let navigationController = UINavigationController(rootViewController: bookListVIewController)
        bookListVIewController.title = R.string.localizable.bookListTitle()
        navigationController.tabBarItem.image = R.image.book_icon()
        
        let configurationViewController = ConfigurationViewController()
        let secondNavigationController = UINavigationController(rootViewController: configurationViewController)
        configurationViewController.title = R.string.localizable.buttonTitleConfig()
        secondNavigationController.tabBarItem.image = R.image.user_icon()
        
        viewControllers = [navigationController, secondNavigationController]
    }
}
