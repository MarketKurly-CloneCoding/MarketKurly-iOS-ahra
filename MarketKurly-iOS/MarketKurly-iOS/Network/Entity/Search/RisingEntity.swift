//
//  RisingEntity.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/05.
//

import Foundation

struct Rising {
    let num: Int
    let title: String
}

extension Rising {
    static func dummy() -> [Rising] {
        return [Rising(num: 1, title: "피클"),
                Rising(num: 2, title: "라이스페이퍼"),
                Rising(num: 3, title: "쵸이닷"),
                Rising(num: 4, title: "최현석"),
                Rising(num: 5, title: "나쵸"),
                Rising(num: 6, title: "드라이기"),
                Rising(num: 7, title: "날치알"),
                Rising(num: 8, title: "튀김"),
                Rising(num: 9, title: "모나카"),
                Rising(num: 10, title: "감바스")]
    }
}
