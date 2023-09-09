//
//  RisingCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/05.
//

import UIKit

import SnapKit

final class RisingCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let risingNum: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .KurlyPurple100
        return label
    }()
    
    let risingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .Gray100
        return label
    }()
    
    let underLine: UIView = {
        let line = UIView()
        line.backgroundColor = .Gray500
        return line
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RisingCollectionViewCell {
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        contentView.addSubviews(risingNum, risingLabel, underLine)
    }
    
    func setLayout() {
        risingNum.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        risingLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(risingNum.snp.trailing).offset(16)
        }
        
        underLine.snp.makeConstraints {
            $0.top.equalTo(risingNum.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func configureCell(_ rising: Rising) {
        risingNum.text = String(rising.num)
        risingLabel.text = rising.title
    }
}

