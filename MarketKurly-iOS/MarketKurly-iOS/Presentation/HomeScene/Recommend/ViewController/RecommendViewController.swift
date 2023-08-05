//
//  RecommendViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/02.
//

import UIKit

import SnapKit

final class RecommendViewController: UIViewController {
    
    private typealias SectionType = Section

    @frozen
    private enum Section: CaseIterable {
        case mainBanner, recommend
    }
    
    private var homeEntity: [HomeEntity] = HomeEntity.dummyData()
    
    // MARK: - UI Components
    
    private let recommendView = RecommendView()
    private lazy var collectionView = recommendView.recommendCollectionView
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setHierarchy()
        setDelegate()
    }

}

extension RecommendViewController {
    func setHierarchy() {
        view.addSubviews(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 592 / 812)
        }
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension RecommendViewController: UICollectionViewDelegate {
    
}

extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .mainBanner:
            let cell = MainBannerCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        case .recommend:
            let cell = RecommendCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setDataBind(model: homeEntity[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .mainBanner:
            return 5
        case .recommend:
            return homeEntity.count
        }
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
}

