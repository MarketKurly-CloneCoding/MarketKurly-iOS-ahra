//
//  UIView+.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/30.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
