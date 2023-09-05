//
//  RecentEntity.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/01.
//

import Foundation

struct Recent {
    let recent: String
}

extension Recent {
    static func dummy() -> [Recent] {
        return [Recent(recent: "된장찌개"),
                Recent(recent: "버섯"),
                Recent(recent: "배추"),
                Recent(recent: "떡볶이"),
                Recent(recent: "마라탕")]
    }
}
