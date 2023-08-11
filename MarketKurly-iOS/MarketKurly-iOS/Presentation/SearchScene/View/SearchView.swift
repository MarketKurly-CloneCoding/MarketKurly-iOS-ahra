//
//  SearchView.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/01.
//

import UIKit

import SnapKit

final class SearchView: UIView {
    
    // MARK: - UI Components
    
    private let navigationBarView: CustomNavigationBar = {
        let view = CustomNavigationBar()
        view.isLogoIncluded = false
        view.isNotTitleIncluded = false
        return view
    }()
    
    private let searchField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "검색어를 입력해주세요"
        textfield.layer.cornerRadius = 4
        textfield.backgroundColor = .Gray500
        textfield.setLeftPadding(amount: 40)
        textfield.setPlaceholderColor(.Gray300)
        textfield.addLeftImage(image: ImageLiterals.TabBar.ic_searchOn)
        return textfield
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

private extension SearchView {
    func setUI() {
        self.backgroundColor = .KurlyWhite
    }
    
    func setLayout() {
        self.addSubviews(navigationBarView, searchField)
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 94 / 812)
        }
        
        searchField.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 343 / 375)
            $0.height.equalTo(44)
        }
    }
}

