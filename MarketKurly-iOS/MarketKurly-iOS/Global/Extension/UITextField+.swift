//
//  UITextField+.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/08.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func addLeftImage(image:UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftimage.image = image
        self.leftView = leftimage
        self.leftViewMode = .always
    }
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [ .foregroundColor: placeholderColor,
                          .font: font
            ].compactMapValues { $0 }
        )
    }
}
