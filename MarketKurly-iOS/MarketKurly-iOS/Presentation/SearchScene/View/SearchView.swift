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
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 4
        searchBar.searchTextField.backgroundColor = .Gray500
        searchBar.backgroundColor = .clear
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.searchTextField.setPlaceholderColor(.Gray300)
        searchBar.searchTextField.font = .systemFont(ofSize: 16, weight: .regular)
        searchBar.setImage(ImageLiterals.Search.search, for: .search, state: .normal)
        return searchBar
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHiearchy()
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
    
    func setHiearchy() {
        self.addSubviews(navigationBarView, searchBar)
    }

    func setLayout() {
        navigationBarView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 94 / 812)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(44)
        }
    }
}
