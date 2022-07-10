//
//  UITextField.swift
//  newlyCoinedWord
//
//  Created by 강민혜 on 7/11/22.
//

import UIKit

extension UITextField {
    
    func leftPadding() {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
}
