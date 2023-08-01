//
//  HomeMenuItem.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/02.
//

import UIKit

 @frozen
 enum MenuPageType: String, CaseIterable {
     case recommend = "컬리추천"
     case newItem = "신상품"
     case bestItem = "베스트"
     case shopping = "알뜰쇼핑"
     case benefit = "특가/혜택"

     var viewController: UIViewController {
         switch self {
         case .recommend:
             return RecommendViewController()
         case .newItem:
             return NewItemViewController()
         case .bestItem:
             return BestItemViewController()
         case .shopping:
             return ShoppingViewController()
         case .benefit:
             return BenefitViewController()
         }
     }
 }
