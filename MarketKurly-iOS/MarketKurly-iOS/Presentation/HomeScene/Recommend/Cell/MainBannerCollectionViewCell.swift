//
//  MainBannerCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/04.
//

import UIKit

final class MainBannerCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    private let mainBannerView: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Home.img_mainBanner
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MainBannerCollectionViewCell {
    
    func setHierarchy() {
        addSubview(mainBannerView)
    }
    
    func setLayout() {
        mainBannerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
            $0.height.equalTo(340)
        }
    }
}
