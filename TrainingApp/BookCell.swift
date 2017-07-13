import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let bookImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.red
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "", font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "", font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    fileprivate let dateLabel: UILabel = {
        let label = UILabel()
        label.labelConfig(text: "", font: .systemFont(ofSize: 15), backgroundColor: .white)
        return label
    }()
    
    func setCell(book: Book) {
        titleLabel.text = book.name
        priceLabel.text = "\(book.price) \(R.string.localizable.yen())"
        dateLabel.text =  Date.formatConverter(dateString: book.purchaseDate)
        let imageURL = URL(string: book.imageData)
        bookImageView.kf.indicatorType = .activity
        bookImageView.kf.setImage(with: imageURL)
    }
}

extension BookTableViewCell {
    fileprivate func setupCellViews() {
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
