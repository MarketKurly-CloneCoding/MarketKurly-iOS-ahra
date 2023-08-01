//
//  HomeMenu.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/02.
//

import UIKit

import SnapKit

final class HomeMenu: UIView {
    
    private let menuLabels = MenuPageType.allCases.map{ $0.rawValue }
    
    private var menuCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private var underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray400
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setCollectionView()
    }
    
    override func draw(_ rect: CGRect) {
        self.isSelected = 0
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeMenu {
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        addSubviews(menuCollectionView, divideLine)
        addSubview(underLine)
    }
    
    func setLayout() {
        
        divideLine.snp.makeConstraints {
            $0.bottom.equalTo(menuCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    func setCollectionView() {
        menuCollectionView.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
}

extension HomeMenu: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else { return HomeMenuCollectionViewCell()}
        cell.title = menuLabels[indexPath.item]
        return cell
    }
}

extension HomeMenu: UICollectionViewDelegate {
}

extension HomeMenu: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: menuLabels[indexPath.row].calcuateWidth(addPadding: 10), height: menuCollectionView.frame.height)
    }
}
