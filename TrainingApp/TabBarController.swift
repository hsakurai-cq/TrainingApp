import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookListController = BookListController()
        let navigationController = UINavigationController(rootViewController: bookListController)
        bookListController.title = R.string.localizable.bookListTitle()
        navigationController.tabBarItem.image = R.image.book_icon()
        
        let configurationController = ConfigurationController()
        let secondNavigationController = UINavigationController(rootViewController: configurationController)
        configurationController.title = R.string.localizable.buttonTitleConfig()
        secondNavigationController.tabBarItem.image = R.image.user_icon()
        
        viewControllers = [navigationController, secondNavigationController]
    }
}
