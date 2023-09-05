//
//  RecentCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/01.
//

import UIKit

import SnapKit

final class RecentCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let recentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .Gray100
        return label
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

extension RecentCollectionViewCell {
    
    func setUI() {
        self.layer.cornerRadius = 17
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.Gray500.cgColor
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        contentView.addSubview(recentLabel)
    }
    
    func setLayout() {
        recentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    func configureCell(_ recent: Recent) {
        recentLabel.text = recent.recent
    }
}
