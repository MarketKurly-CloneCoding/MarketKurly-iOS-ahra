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
        var config = UIButton.Configuration.plain()
        var titleAttribute = AttributedString.init("전체보기")
        titleAttribute.foregroundColor = .KurlyPurple100
        titleAttribute.font = .systemFont(ofSize: 14, weight: .regular)
        config.attributedTitle = titleAttribute
        config.image = ImageLiterals.Home.ic_go
        config.imagePlacement = .trailing
        
        let button = UIButton()
        button.configuration = config
        button.isHidden = true
        button.sizeToFit()
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
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(-15)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
    }
    
    func setTitle(title: String) {
        headerLabel.text = title
    }
}
