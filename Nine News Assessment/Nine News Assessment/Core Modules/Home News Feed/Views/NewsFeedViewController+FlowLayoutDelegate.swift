//
//  NewsFeedViewController+FlowLayoutDelegate.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import UIKit

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: UIScreen.main.bounds.width,
                          height: CGFloat(SystemConstants.NewsFeed.cellHeight))
        
        return size
    }
}
