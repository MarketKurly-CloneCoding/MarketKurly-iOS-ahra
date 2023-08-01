//
//  CustomNavigationBar.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

import SnapKit

final class CustomNavigationBar: UIView {
    
    public var isNotLeftButtonIncluded: Bool {
        get { !leftButton.isHidden }
        set { leftButton.isHidden = !newValue
            backView.backgroundColor = .KurlyWhite
            navigationView.backgroundColor = .KurlyWhite
            cartButton.setImage(ImageLiterals.NavigationBar.ic_cart.withTintColor(.KurlyBlack), for: .normal)
        }
    }
    
    public var isNotTitleIncluded: Bool {
        get { !searchTitleLabel.isHidden }
        set {
            searchTitleLabel.isHidden = newValue
            detailTitleLabel.isHidden = !newValue
        }
    }
    
    public var isLogoIncluded: Bool {
        get { !logoImageView.isHidden }
        set { logoImageView.isHidden = !newValue }
    }
    
    public var isNaviIncluded: Bool {
        get { !naviButton.isHidden }
        set { naviButton.isHidden = !newValue }
    }
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.NavigationBar.ic_back, for: .normal)
        button.isHidden = true
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = ImageLiterals.NavigationBar.img_logo
        return logo
    }()
    
    private let searchTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "검색"
        label.textColor = .KurlyWhite
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    private let detailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "[옥이네] 차돌된장찌개"
        label.textColor = .KurlyBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    lazy var naviButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.NavigationBar.ic_navi, for: .normal)
        return button
    }()
    
    lazy var cartButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.NavigationBar.ic_cart, for: .normal)
        return button
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .KurlyPurple
        return view
    }()
    
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .KurlyPurple
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationBar {
//    func setUI() {
//        self.backgroundColor = .PrimaryPurple
//    }
    
    func setLayout() {
//        self.addSubviews(leftButton, logoImageView, detailTitleLabel, naviButton, cartButton)
        navigationView.addSubviews(leftButton, logoImageView, detailTitleLabel,searchTitleLabel, naviButton, cartButton)
        self.addSubviews(backView, navigationView)
//
//        self.snp.makeConstraints {
//            $0.height.equalTo(94)
//        }
        
        backView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 44 / 812)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
        
        leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(46)
        }
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(62)
            $0.height.equalTo(36)
        }
        
        detailTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        searchTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(6)
            $0.size.equalTo(46)
        }
        
        naviButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(cartButton.snp.leading)
            $0.size.equalTo(46)
        }
    }
}

