//
//  NewsFeedViewController.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

final class NewsFeedViewController: UIViewController {
    weak var mainCoordinator: MainCoordinator?
    private var newsAssetManager: NewsAssetManager!
    private var newsFeedCollectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<NewsCollectionViewSection, NewsAssetModel>!
    
    enum NewsCollectionViewSection {
        case main
    }
    
    // MARK: UIViewController Lifecycle
    init(newsAssetManager: NewsAssetManager) {
        self.newsAssetManager = newsAssetManager
        super.init(nibName: nil, bundle: nil)
    }
    
    // Even though this is considered unsafe, there is no chance of
    // Storyboard instantiation in this projects
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        
        newsAssetManager.newsAssets.forEach { newsAsset in
            print(newsAsset.author)
        }
    }
    
    
}

// MARK: CONFIGURE LAYOUT
extension NewsFeedViewController {
    
    private func configureInterface() {
        view.backgroundColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        title = Date().getGreeting()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        newsFeedCollectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: getCollectionViewLayout())
        newsFeedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsFeedCollectionView.register(NewsFeedCell.self,
                                        forCellWithReuseIdentifier: NewsFeedCell.identifier)
        newsFeedCollectionView.delegate = self
        newsFeedCollectionView.alwaysBounceVertical = true
        newsFeedCollectionView.showsVerticalScrollIndicator = false
        newsFeedCollectionView.backgroundColor = .clear
        view.addSubview(newsFeedCollectionView)
        newsFeedCollectionView.pin(to: view)
        configureDataSource()
    }
    
    private func getCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }
}

// MARK: CONFIGURE DATASOURCE
extension NewsFeedViewController {
    
    func configureDataSource() {
        // Create diffable data source & connect it to the collection view
        dataSource = UICollectionViewDiffableDataSource<NewsCollectionViewSection, NewsAssetModel>(collectionView: newsFeedCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, newsAsset: NewsAssetModel) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedCell.identifier,
                                                                for: indexPath) as? NewsFeedCell else {
                return UICollectionViewCell()
            }
            
            cell.loadNewsAsset(newsAsset)
            return cell
        }
        
        // Load initial data
        var snapshot = NSDiffableDataSourceSnapshot<NewsCollectionViewSection, NewsAssetModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(newsAssetManager.newsAssets)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
