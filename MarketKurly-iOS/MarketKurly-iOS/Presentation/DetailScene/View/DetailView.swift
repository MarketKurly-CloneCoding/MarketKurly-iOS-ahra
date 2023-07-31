//
//  DetailView.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/01.
//

import UIKit

final class DetailView: UIView {
    
    // MARK: - UI Components
    
    private let navigationBarView: CustomNavigationBar = {
        let view = CustomNavigationBar()
        view.isLogoIncluded = false
        view.isNotTitleIncluded = true
        view.isNotLeftButtonIncluded = true
        view.isNaviIncluded = true
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension DetailView {
    func setUI() {
        self.backgroundColor = .KurlyWhite
    }
    
    func setLayout() {
        self.addSubview(navigationBarView)
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 94 / 812)
        }
    }
}
