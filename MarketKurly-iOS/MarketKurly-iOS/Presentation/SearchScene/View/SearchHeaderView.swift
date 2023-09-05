//
//  SearchHeaderView.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/05.
//

import UIKit

import SnapKit

final class SearchHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let headerTitle: UILabel = {
        let label = UILabel()
        label.textColor = .KurlyBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let headerSubTitle: UILabel = {
        let label = UILabel()
        label.text = "최근 1시간 동안 검색횟수가 급상승했어요"
        label.textColor = .Gray300
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
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

extension SearchHeaderView {
    func setUI() {
        self.backgroundColor = .KurlyWhite
    }
    
    func setHiearchy() {
        self.addSubviews(headerTitle, headerSubTitle)
    }

    func setLayout() {
        headerTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        headerSubTitle.snp.makeConstraints {
            $0.top.equalTo(headerTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
    }
    
    func setHeaderTitle(title: String) {
        headerTitle.text = title
    }

    func hideSubTitle(hide: Bool) {
        headerSubTitle.isHidden = hide
    }
}

