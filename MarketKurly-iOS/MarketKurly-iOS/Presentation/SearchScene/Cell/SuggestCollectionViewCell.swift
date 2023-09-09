//
//  SuggestCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/09/05.
//

import UIKit

import SnapKit

final class SuggestCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let suggestLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .KurlyPurple100
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

extension SuggestCollectionViewCell {
    func setUI() {
        self.layer.cornerRadius = 17
        self.backgroundColor = .KurlyPurple300
    }
    
    func setHierarchy() {
        contentView.addSubview(suggestLabel)
    }
    
    func setLayout() {
        suggestLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    func configureCell(_ suggest: Suggest) {
        suggestLabel.text = suggest.suggest
    }
}

