//
//  SizeLiterals.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/01.
//

import UIKit

struct SizeLiterals {
    
    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}
