//
//  TabBarItem.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/01.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
     case home
     case category
     case search
     case mypage
 }

extension TabBarItemType {
     var title: String {
         switch self {
         case .home:
             return "홈"
         case .category:
             return "카테고리"
         case .search:
             return "검색"
         case .mypage:
             return "마이컬리"
         }
     }

     var unSelectedIcon: UIImage {
         switch self {
         case .home:
             return ImageLiterals.TabBar.ic_home
         case .category:
             return ImageLiterals.TabBar.ic_category
         case .search:
             return ImageLiterals.TabBar.ic_search
         case .mypage:
             return ImageLiterals.TabBar.ic_mypage
         }
     }

     var selectedIcon: UIImage {
         switch self {
         case .home:
             return ImageLiterals.TabBar.ic_homeOn
         case .category:
             return ImageLiterals.TabBar.ic_categoryOn
         case .search:
             return ImageLiterals.TabBar.ic_searchOn
         case .mypage:
             return ImageLiterals.TabBar.ic_mypageOn
         }
     }

     public func setTabBarItem() -> UITabBarItem {
         return UITabBarItem(
             title: title,
             image: unSelectedIcon,
             selectedImage: selectedIcon)
     }
 }
