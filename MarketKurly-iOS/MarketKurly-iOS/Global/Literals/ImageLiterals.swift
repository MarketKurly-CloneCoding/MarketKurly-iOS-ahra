//
//  ImageLiterals.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/30.
//

import UIKit

enum ImageLiterals {
    enum TabBar {
        static var ic_home: UIImage { .load(name: "home") }
        static var ic_homeOn: UIImage { .load(name: "home_on") }
        static var ic_category: UIImage { .load(name: "category") }
        static var ic_categoryOn: UIImage { .load(name: "category_on") }
        static var ic_search: UIImage { .load(name: "search") }
        static var ic_searchOn: UIImage { .load(name: "search_on") }
        static var ic_mypage: UIImage { .load(name: "mypage") }
        static var ic_mypageOn: UIImage { .load(name: "mypage_on") }
    }
    
    enum NavigationBar {
        static var img_logo: UIImage { .load(name: "logo") }
        static var ic_navi: UIImage { .load(name: "navi") }
        static var ic_cart: UIImage { .load(name: "cart") }
        static var ic_back: UIImage { .load(name: "back") }
    }
    
    enum Home {
        static var img_mainBanner: UIImage { .load(name: "main_banner") }
        static var img_banner: UIImage { .load(name: "banner") }
        static var img_product: UIImage { .load(name: "product") }
    }
}
