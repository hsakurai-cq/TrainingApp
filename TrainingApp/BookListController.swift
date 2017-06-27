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
    let bookArray: Array = ["first", "second", "third"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "書籍一覧"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.red
        
        //print(navigationController?.navigationBar.frame.size.height)
        //print(tabBarController?.tabBar.frame.size.height)
        
        bookTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100))
        bookTableView.rowHeight = 100
        bookTableView.register(BookCell.self, forCellReuseIdentifier: "bookCell")
        bookTableView.dataSource = self
        bookTableView.delegate = self
        
        let readMoreButton = UIButton(frame: CGRect(x: 0, y: view.frame.height - 40 - 49, width: view.frame.width, height: 40))
        readMoreButton.setTitle("reda more...", for: UIControlState())
        readMoreButton.backgroundColor = UIColor.darkGray

        view.addSubview(bookTableView)
        view.addSubview(readMoreButton)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return bookTableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    }
    
}
