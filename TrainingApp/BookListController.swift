import UIKit

class BookListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var bookTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        view.backgroundColor = UIColor.red
        
        bookTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100))
        
        bookTableView.rowHeight = 100
        bookTableView.register(BookCell.self, forCellReuseIdentifier: Constants.bookCell)
        bookTableView.dataSource = self
        bookTableView.delegate = self

        view.addSubview(bookTableView)
        view.addSubview(loadMoreButton)
        setupLoadMoreButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //viewDidLoadに書くと他のviewControllerから戻って来た時反映されないため
        self.tabBarController?.navigationItem.title = R.string.localizable.bookListTitle()
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleAdd(), style: .plain, target: self, action: #selector(tappedAddButton))
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
    }
    
    func tappedAddButton() {
        let addBookController = AddBookController()
        let toAddBook = UINavigationController(rootViewController: addBookController)
        present(toAddBook, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = bookTableView.dequeueReusableCell(withIdentifier: Constants.bookCell, for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editBookController = EditBookController()
        navigationController?.pushViewController(editBookController, animated: true)
    }
    
    let loadMoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle(R.string.localizable.buttonTitleLoadMore(), for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(loadMore), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func loadMore() {
        //Todo 読み込み処理
    }
    
    func setupLoadMoreButton() {
        loadMoreButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loadMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loadMoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadMoreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
        
}
