//
//  TabBarController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

import SnapKit

class TabBarController: UITabBarController {
    
    // MARK: - UI Components
    
    private var tabs: [UIViewController] = []
        
    private let TabBarHeight: CGFloat = SizeLiterals.Screen.screenHeight * 48 / 812

    private let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .Gray400
        return lineView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setTabBarItem()
        setTabBar()
    }
}

// MARK: - Extensions

private extension TabBarController {
    
    func setLayout() {
        tabBar.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top)
            $0.height.equalTo(1)
        }
    }
    
    func setTabBarItem() {
        tabs = [
            HomeViewController(),
            DetailViewController(),
            SearchViewController(),
            ViewController()
        ]
        
        TabBarItemType.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.setTabBarItem()
            setViewControllers(tabs, animated: false)
        }
    }
    
    func setTabBar() {
        tabBar.backgroundColor = .KurlyWhite
        tabBar.isTranslucent = false
        tabBar.tintColor = .KurlyPurple
        tabBar.unselectedItemTintColor = .KurlyBlack
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
