//
//  BookListController.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/26.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class BookListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var bookTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title = "書籍一覧"
        
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "追加", style: .plain, target: self, action: #selector(handleAddButton))
        
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        view.backgroundColor = UIColor.red
        
        //print(navigationController?.navigationBar.frame.size.height)
        //print(tabBarController?.tabBar.frame.size.height)
        
        bookTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100))
        bookTableView.rowHeight = 100
        bookTableView.register(BookCell.self, forCellReuseIdentifier: "bookCell")
        bookTableView.dataSource = self
        bookTableView.delegate = self

        view.addSubview(bookTableView)
    }
    
    func handleAddButton() {
        print("add button")
        let addBookController = AddBookController()
        let toAddBook = UINavigationController(rootViewController: addBookController)
        present(toAddBook, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return bookTableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    }
    
}
