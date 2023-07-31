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
        
    private let TabBarHeight: CGFloat = 48

    private let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .Gray400
        return lineView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setTabBar()
    }
}

// MARK: - Extensions

private extension TabBarController {
    
    func makeTabBar(viewController: UIViewController,
                    title: String,
                    tabBarImg: UIImage,
                    tabBarSelectedImg: UIImage,
                    renderingMode: UIImage.RenderingMode) -> UIViewController {

        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))

        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)

        tabBar.tintColor = .KurlyPurple
        tabBar.unselectedItemTintColor = .KurlyBlack
        
        return tab
    }
    
    func setLayout() {
        tabBar.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top)
            $0.height.equalTo(1)
        }
    }
    
    func setTabBar() {
        let home = makeTabBar(
            viewController: HomeViewController(),
            title: "홈",
            tabBarImg: ImageLiterals.TabBar.ic_home,
            tabBarSelectedImg: ImageLiterals.TabBar.ic_homeOn,
            renderingMode: .alwaysOriginal
        )
        let category = makeTabBar(
            viewController: DetailViewController(),
            title: "카테고리",
            tabBarImg: ImageLiterals.TabBar.ic_category,
            tabBarSelectedImg: ImageLiterals.TabBar.ic_categoryOn,
            renderingMode: .alwaysOriginal
        )
        let search = makeTabBar(
            viewController: SearchViewController(),
            title: "검색",
            tabBarImg: ImageLiterals.TabBar.ic_search,
            tabBarSelectedImg: ImageLiterals.TabBar.ic_searchOn,
            renderingMode: .alwaysOriginal
        )
        let mypage = makeTabBar(
            viewController: ViewController(),
            title: "마이컬리",
            tabBarImg: ImageLiterals.TabBar.ic_mypage,
            tabBarSelectedImg: ImageLiterals.TabBar.ic_mypageOn,
            renderingMode: .alwaysOriginal
        )

        let tabs = [home, category, search, mypage]
        self.setViewControllers(tabs, animated: false)
        tabBar.backgroundColor = .KurlyWhite
        tabBar.isTranslucent = false
    }
}
