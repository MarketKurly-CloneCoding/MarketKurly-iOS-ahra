//
//  SaleCollectionViewCell.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/05.
//

import UIKit

import SnapKit

final class SaleCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
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
    
    private let presentLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .KurlyPink
        label.text = "선물하기"
        label.textColor = .KurlyWhite
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        return label
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

extension SaleCollectionViewCell {
    
    func setHierarchy() {
        addSubviews(productImage, cartButton, presentLabel, productTitle, salePercent, salePrice, originalPrice)
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
        presentLabel.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.top)
            $0.leading.equalTo(productImage.snp.leading)
            $0.width.equalTo(58)
            $0.height.equalTo(24)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        salePercent.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
        
        salePrice.snp.makeConstraints {
            $0.top.equalTo(salePercent.snp.top)
            $0.leading.equalTo(salePercent.snp.trailing).offset(4)
        }
        
        originalPrice.snp.makeConstraints {
            $0.top.equalTo(salePercent.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
    }
    
    func setDataBind(model: SaleEntity) {
        presentLabel.isHidden = model.present ? false : true
        productImage.image = model.productImage
        productTitle.text = model.productTitle
        salePercent.text = "\(model.salePercent)%"
        salePrice.text = model.salePrice.makePriceLabelFromNumber()
        originalPrice.text = model.originalPrice.makePriceLabelFromNumber()
        originalPrice.attributedText = originalPrice.text?.strikeThrough()
    }
}

