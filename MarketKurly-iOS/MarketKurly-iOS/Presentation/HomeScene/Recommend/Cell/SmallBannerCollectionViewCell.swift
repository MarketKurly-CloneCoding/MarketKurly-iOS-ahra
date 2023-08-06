//
//  SmallBannerCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/05.
//

import UIKit

import SnapKit

final class SmallBannerCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Home.img_banner
        image.contentMode = .scaleAspectFit
        return image
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

extension SmallBannerCollectionViewCell {
    func setHierarchy() {
        addSubview(bannerImage)
    }
    
    func setLayout() {
        bannerImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(78)
        }
    }
}
