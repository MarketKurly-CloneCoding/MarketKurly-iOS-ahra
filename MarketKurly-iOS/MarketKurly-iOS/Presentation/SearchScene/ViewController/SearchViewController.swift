//
//  SearchViewController.swift
//  MarketKurly-iOS
//
//  Created by 고아라 on 2023/07/31.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private var recentEntity = Recent.dummy()
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case recent
        // recommend, rising
    }
    
    // MARK: - UI Components
    
    private let searchView = SearchView()
    private lazy var searchCollectionView = SearchCollectionView()
    private lazy var collectionView = searchCollectionView.collectionView
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setDelegate()
        setLayout()
    }
}

extension SearchViewController {
    func setUI() {
        view.backgroundColor = .KurlyWhite
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setHierarchy() {
        view.addSubviews(searchView, collectionView)
    }
    
    func setLayout() {
        searchView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .recent:
            let cell =
            RecentCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(recentEntity[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .recent:
            return recentEntity.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .recent:
            let headerView = SearchHeaderView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            headerView.setHeaderTitle(title: "최근 검색어")
            return headerView
        }
    }
}
