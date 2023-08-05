//
//  HeaderCollectionReusableView.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/05.
//

import UIKit

import SnapKit

final class HeaderCollectionReusableView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    static let isFromNib: Bool = false
    
    public var isButtonIncluded: Bool {
        get { !headerButton.isHidden }
        set { headerButton.isHidden = !newValue }
    }
    
    // MARK: - UI Components
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .KurlyBlack
        return label
    }()
    
    lazy var headerButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.titleLabel?.textColor = .KurlyPurple100
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setImage(ImageLiterals.Home.ic_go, for: .normal)
        button.isHidden = true
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension HeaderCollectionReusableView {
    func setHierarchy() {
        addSubviews(headerLabel, headerButton)
    }
    
    func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        headerButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    func setTitle(title: String) {
        headerLabel.text = title
    }
}
