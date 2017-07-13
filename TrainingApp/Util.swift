import Foundation
import UIKit

extension UILabel {
    func labelConfig(text: String, font: UIFont, backgroundColor: UIColor) {
        self.text = text
        self.font = font
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
    }
}

extension UITextField {
    func textFieldConfig() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .roundedRect
    }
}

extension UIButton {
    func buttonConfig(backgroundColor: UIColor, font: UIFont, tite: String, tintColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = font
        self.setTitle(tite, for: .normal)
        self.setTitleColor(tintColor, for: .normal)
    }
}

extension Date {
    static func toString(sender: UIDatePicker) -> String {
        let dateFormmtter = DateFormatter()
        dateFormmtter.dateFormat = Constants.dateFormat
        return dateFormmtter.string(from: sender.date)
    }
    
    static func formatConverter(dateString: String) -> String {
        let inFormatter = DateFormatter()
        if let userLocale = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            inFormatter.locale = Locale(identifier: userLocale)
        }
        inFormatter.dateFormat = "EEE, dd MM yyyy HH:mm:ss Z"
        let date: NSDate = inFormatter.date(from: dateString)! as NSDate
        let outFormatter = DateFormatter()
        outFormatter.dateFormat = Constants.dateFormat
        return outFormatter.string(from: date as Date)
    }
}

extension UIAlertController {
    static func showAlert(error: String, view: UIViewController) {
        let alert = UIAlertController(title: R.string.localizable.error(), message: error, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil)
        alert.addAction(alertAction)
        view.present(alert, animated: true, completion: nil)
    }
}
