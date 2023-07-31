//
//  SearchViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let searchView = SearchView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = searchView
    }
}
