//
//  BookCell.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/27.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bookImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Book Title"
        label.backgroundColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "3200円 + 税"
        label.textAlignment = NSTextAlignment.right
        label.backgroundColor = UIColor.brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2017/06/15"
        label.backgroundColor = UIColor.green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCellViews() {
        
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(dateLabel)
        
        bookImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:15).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3).isActive = true
        bookImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: bookImageView.rightAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bookImageView.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: bookImageView.heightAnchor, multiplier: 1/4).isActive = true
        
        priceLabel.leftAnchor.constraint(equalTo: bookImageView.rightAnchor, constant: 20).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: bookImageView.heightAnchor, multiplier: 1/4).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        dateLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 10).isActive = true
        
    }
    
    
    
}
