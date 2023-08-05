//
//  RecommendCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/04.
//

import UIKit

import SnapKit

final class RecommendCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Home.btn_cart, for: .normal)
        return button
    }()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .Gray100
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private let salePercent: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .KurlyOrange
        return label
    }()
    
    private let salePrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .Gray100
        return label
    }()
    
    private let originalPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .Gray300
        return label
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

extension RecommendCollectionViewCell {
    
    func setHierarchy() {
        addSubviews(productImage, cartButton, productTitle, salePercent, salePrice, originalPrice)
    }
    
    func setLayout() {
        productImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(194)
        }
        
        cartButton.snp.makeConstraints {
            $0.trailing.equalTo(productImage.snp.trailing).offset(-8)
            $0.bottom.equalTo(productImage.snp.bottom).offset(-8)
            $0.size.equalTo(36)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        salePercent.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        salePrice.snp.makeConstraints {
            $0.top.equalTo(salePercent.snp.top)
            $0.leading.equalTo(salePercent.snp.trailing).offset(4)
        }
        
        originalPrice.snp.makeConstraints {
            $0.top.equalTo(salePercent.snp.bottom)
            $0.leading.equalToSuperview()
        }
    }
    
    func setDataBind(model: HomeEntity) {
        productImage.image = model.productImage
        productTitle.text = model.productTitle
        originalPrice.text = model.originalPrice.makePriceLabelFromNumber()
        
        if model.salePercent != nil {
            salePercent.text = "\(model.salePercent ?? 0)%"
            salePrice.text = model.salePrice?.makePriceLabelFromNumber()
            originalPrice.attributedText = originalPrice.text?.strikeThrough()
        } else {
            originalPrice.font = .systemFont(ofSize: 14, weight: .bold)
            originalPrice.textColor = .Gray100
        }
    }
}

