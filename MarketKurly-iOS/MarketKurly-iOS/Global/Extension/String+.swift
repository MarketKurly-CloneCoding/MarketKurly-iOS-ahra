//
//  String+.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/02.
//

import UIKit

extension String {

     /// String의 너비를 반환해주는 함수
     /// - Parameter addPadding: padding값을 더해줄때 사용(기본값 0)
     /// - Returns: string의 너비값(실제로는 string을 넣은 label의 너비값)
     func calcuateWidth(addPadding: CGFloat = 0) -> CGFloat {
         let label = UILabel()
         label.text = self
         label.font = .systemFont(ofSize: 15, weight: .regular)
         label.sizeToFit()
         return label.frame.width + addPadding
     }
    
    // 취소선 넣어주는 함수
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
 }
