//
//  HomeEntity.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/30.
//

import UIKit

struct HomeEntity {
    let productImage: UIImage
    let productTitle: String
    let salePercent: Int?
    let salePrice: Int?
    let originalPrice: Int
}

extension HomeEntity {
    
    static func dummyData() -> [HomeEntity] {
        return [
            HomeEntity(productImage: ImageLiterals.Home.img_product, productTitle: "[YOZM] 플레인 그릭요거트 2종", salePercent: 10, salePrice: 3510, originalPrice: 3000),
            HomeEntity(productImage: ImageLiterals.Home.img_product, productTitle: "[서울우유] 비요뜨 요거트 6종", salePercent: nil, salePrice: nil, originalPrice: 1330),
            HomeEntity(productImage: ImageLiterals.Home.img_product, productTitle: "[YOZM] 플레인 그릭요거트 2종", salePercent: 10, salePrice: 3510, originalPrice: 3000)
        ]
    }
}
