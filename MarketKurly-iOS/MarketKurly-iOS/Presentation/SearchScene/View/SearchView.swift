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
        textfield.font = .systemFont(ofSize: 16, weight: .regular)
        textfield.layer.cornerRadius = 4
        textfield.backgroundColor = .Gray500
        textfield.addLeftImage(image: ImageLiterals.Search.search)
        textfield.setPlaceholderColor(.Gray300)
        return textfield
    }()
    
//    private let recentTitle: UILabel = {
//        let label = UILabel()
//        label.text = "최근 검색어"
//        label.textColor = .KurlyBlack
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        return label
//    }()
    
//    private let flowLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 12
//        layout.itemSize.height = 36
//        layout.scrollDirection = .horizontal
//        return layout
//    }()
//
//    lazy var recentCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.clipsToBounds = true
//        collectionView.contentInsetAdjustmentBehavior = .never
//        collectionView.isUserInteractionEnabled = true
//        collectionView.allowsSelection = true
//        return collectionView
//    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHiearchy()
//        registerCell()
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
        self.addSubviews(navigationBarView, searchField)
    }
    
//    func registerCell() {
//        RecentCollectionViewCell.register(target: recentCollectionView)
//    }

    func setLayout() {
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
        
//        recentTitle.snp.makeConstraints {
//            $0.top.equalTo(searchField.snp.bottom).offset(20)
//            $0.leading.equalToSuperview().inset(20)
//        }
        
//        recentCollectionView.snp.makeConstraints {
//            $0.top.equalTo(recentTitle.snp.bottom).offset(16)
//            $0.leading.equalTo(recentTitle.snp.leading)
//            $0.trailing.equalToSuperview()
//            $0.height.equalTo(36)
//        }
    }
}
