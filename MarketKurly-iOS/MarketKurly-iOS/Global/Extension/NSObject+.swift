//
//  NSObject+.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import Foundation

extension NSObject {

    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
}
