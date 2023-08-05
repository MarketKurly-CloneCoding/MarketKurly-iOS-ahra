//
//  SaleEntity.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/05.
//

import UIKit

struct SaleEntity {
    let present: Bool
    let productImage: UIImage
    let productTitle: String
    let salePercent: Int
    let salePrice: Int
    let originalPrice: Int
}

extension SaleEntity {
    
    static func dummyData() -> [SaleEntity] {
        return [
            SaleEntity(present: true, productImage: ImageLiterals.Home.img_product, productTitle: "[욱이네] 차돌된장찌개", salePercent: 25, salePrice: 4875, originalPrice: 6500),
            SaleEntity(present: false, productImage: ImageLiterals.Home.img_product, productTitle: "[뚝방길홍차가게] 시그니처 스콘생지 2종(4입)", salePercent: 10, salePrice: 7560, originalPrice: 8400),
            SaleEntity(present: false, productImage: ImageLiterals.Home.img_product, productTitle: "[욱이네] 차돌된장찌개", salePercent: 25, salePrice: 4875, originalPrice: 6500)
        ]
    }
}

