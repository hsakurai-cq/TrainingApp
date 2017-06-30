//
//  ViewUtil.swift
//  TrainingApp
//
//  Created by 櫻井寛海 on 2017/06/30.
//  Copyright © 2017年 櫻井寛海. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func labelConfig(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 15)
        self.backgroundColor = UIColor.red
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
    }
}

extension UITextField {
    func textFieldConfig() {
        self.backgroundColor = .blue
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    func buttonConfig(text: String, backgroundColor: UIColor, font: UIFont) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = font
    }
}
