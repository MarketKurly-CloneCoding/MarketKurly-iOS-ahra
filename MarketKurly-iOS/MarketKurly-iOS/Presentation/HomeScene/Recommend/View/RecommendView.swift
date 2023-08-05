//
//  RecommendView.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/08/03.
//

import UIKit

import SnapKit

final class RecommendView: UIView {
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case mainBanner, recommend
    }
    
    // MARK: - UI Components
    
    lazy var recommendCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.allowsSelection = true
        collectionView.backgroundColor = .KurlyWhite
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RecommendView {
    func setHierarchy() {
        addSubview(recommendCollectionView)
    }
    
    func setLayout() {
        recommendCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func registerCell() {
        MainBannerCollectionViewCell.register(target: recommendCollectionView)
        HeaderCollectionReusableView.register(target: recommendCollectionView)
        RecommendCollectionViewCell.register(target: recommendCollectionView)
    }
    
    func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = Section.allCases[sectionIndex]
            switch sectionType {
            case .mainBanner:
                return self.getLayoutMainBanner()
            case .recommend:
                return self.getLayoutRecommend()
            }
        }
    }
    
    func getLayoutMainBanner() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(340)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    func getLayoutRecommend() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150),
            heightDimension: .absolute(278)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(316/375),
            heightDimension: .absolute(318)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(52)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 16, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
