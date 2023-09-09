//
//  SuggestEntity.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/05.
//

import Foundation

struct Suggest {
    let suggest: String
}

extension Suggest {
    static func dummy() -> [Suggest] {
        return [Suggest(suggest: "갈비탕"),
                Suggest(suggest: "불고기"),
                Suggest(suggest: "삼겹살"),
                Suggest(suggest: "그래놀라"),
                Suggest(suggest: "블루베리"),
                Suggest(suggest: "돈까스"),
                Suggest(suggest: "떡볶이"),
                Suggest(suggest: "냉면")]
    }
}
