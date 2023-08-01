//
//  HomeMenuCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/02.
//

import UIKit

import SnapKit

final class HomeMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeMenuCollectionViewCell"
    
    var title: String? {
        didSet {
            menuTitleLabel.text = title
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuTitleLabel.textColor = isSelected ? .KurlyPurple : .Gray200
        }
    }
    
    lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Gray200
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension HomeMenuCollectionViewCell {
    func setHierarchy() {
        addSubview(menuTitleLabel)
    }
    
    func setLayout() {
        menuTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
    }
}
