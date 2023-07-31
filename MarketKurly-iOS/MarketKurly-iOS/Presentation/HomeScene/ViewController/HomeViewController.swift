//
//  HomeViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = homeView
    }
}
