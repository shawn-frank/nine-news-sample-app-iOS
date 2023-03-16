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

// MARK: CONFIGURE COLLECTION VIEW DATASOURCE
extension NewsFeedViewController {
    
    func configureDataSource() {
        // Create diffable data source & connect it to the collection view
        dataSource = UICollectionViewDiffableDataSource<NewsCollectionViewSection, NewsAssetModel>(collectionView: newsFeedCollectionView) { [weak self]
            (collectionView: UICollectionView, indexPath: IndexPath, newsAsset: NewsAssetModel) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedCell.identifier,
                                                                for: indexPath) as? NewsFeedCell else {
                return UICollectionViewCell()
            }
            
            cell.headline.text = newsAsset.headline
            cell.abstract.text = newsAsset.abstract
            
            let thumbnailImageURLString = self?.newsAssetManager.getThumbnailURL(for: newsAsset)
            cell.loadThumbnail(thumbnailImageURLString)
            
            return cell
        }
        
        // Load initial data
        var snapshot = NSDiffableDataSourceSnapshot<NewsCollectionViewSection, NewsAssetModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(newsAssetManager.newsAssets)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: CONFIGURE COLLECTION VIEW DELEGATE
extension NewsFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let newsAsset = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        mainCoordinator?.loadURL(newsAsset.url)
    }
}
