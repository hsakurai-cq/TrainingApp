import UIKit
import APIKit
import Himotoki

class BookListViewController: UIViewController {
    
    var books: [Book] = []
    var page = 163
    
    lazy var bookTableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        table.register(BookTableViewCell.self, forCellReuseIdentifier: Constants.bookCell)
        table.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 100)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    let loadMoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle(R.string.localizable.buttonTitleLoadMore(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(tappedLoadMoreButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        view.backgroundColor = .red
        
        setupBookListViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //viewDidLoadに書くと他のviewControllerから戻って来た時反映されないため
        self.tabBarController?.navigationItem.title = R.string.localizable.bookListTitle()
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleAdd(), style: .plain, target: self, action: #selector(tappedAddButton))
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizable.buttonTitleNil(), style: .plain, target: self, action: nil)
        
        fetchBooks()
    }
    
    func fetchBooks() {
        let request = BookListRequest(page: "0-\(page)")
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
                self.books = response.result
                self.bookTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tappedAddButton() {
        let addBookController = AddBookViewController()
        let toAddBook = UINavigationController(rootViewController: addBookController)
        present(toAddBook, animated: true, completion: nil)
        print("tapped add button")
    }
    
    func tappedLoadMoreButton() {
        //Todo 読み込み処理
        print("tapped load more button...")
        page += 1
        let request = BookListRequest(page: "0-\(page)")
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
                self.books = response.result
                self.bookTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showBookDetail(book: Book) {
        let editBookController = EditBookViewController()
        editBookController.book = book
        navigationController?.pushViewController(editBookController, animated: true)
    }

}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = bookTableView.dequeueReusableCell(withIdentifier: Constants.bookCell, for: indexPath) as! BookTableViewCell
        cell.setCell(book: books[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookInfo = books[indexPath.item]
        showBookDetail(book: bookInfo)
    }
}

//Anchor設定
extension BookListViewController {
    func setupBookListViews() {
        view.addSubview(bookTableView)
        view.addSubview(loadMoreButton)
        
        loadMoreButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loadMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loadMoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadMoreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
