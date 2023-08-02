//
//  HomeViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {

    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    var dataViewController: [UIViewController] = []
    var currentPage = 0
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setLayout()
        setPageViewController()
        setDelegate()
    }
}

// MARK: - Extensions

extension HomeViewController {
    func setHierarchy() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
    }
    
    func setPageViewController() {
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        dataViewController = MenuPageType.allCases.map{ $0.viewController }
        
        if let firstVC = dataViewController.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setLayout() {
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(homeView.homeMenuView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 592 / 812)
        }
    }
    
    func setDelegate() {
        homeView.homeMenuView.homeMenuDelegate = self
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

extension HomeViewController: HomeMenuDelegate {
    func didSelectMenu(at index: Int) {
        let selectedViewController = dataViewController[index]
        pageViewController.setViewControllers([selectedViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension HomeViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = dataViewController.firstIndex(of: currentVC) else { return }
        currentPage = currentIndex
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewController.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewController[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewController.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        guard nextIndex != dataViewController.count else { return nil }
        return dataViewController[nextIndex]
    }
}
