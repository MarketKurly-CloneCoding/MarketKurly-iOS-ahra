//
//  DetailViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/01.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - UI Components
    
    private let detailView = DetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = detailView
    }
}
