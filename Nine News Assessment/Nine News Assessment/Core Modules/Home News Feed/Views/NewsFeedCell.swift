//
//  NewsFeedCell.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import UIKit
import Combine

class NewsFeedCell: UICollectionViewCell {
    static let identifier = "com.mindhyve.practice.nine-assessment.News-Feed-Cell"
    
    var thumbNail: UIImageView!
    var headline: UILabel!
    var abstract: UILabel!
    var published: UILabel!
    
    var subscriber: AnyCancellable?
    
    // Even though this is considered unsafe, there is no chance of
    // Storyboard instantiation in this projects
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        thumbNail.image = nil
        subscriber?.cancel()
        super.prepareForReuse()
    }
    
    func loadThumbnail(_ urlString: String?) {
        
        guard let urlString = urlString,
              let thumbnailURL = URL(string: urlString) else {
            return
        }
        
        subscriber = AsyncImageService.shared.loadImage(thumbnailURL)
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.thumbNail.image = $0 }
    }
}

// MARK: CONFIGURE LAYOUT
extension NewsFeedCell {
    
    private func configureCell() {
        contentView.backgroundColor = .white
        configureImageView()
        configureHeadlineLabel()
        configureAbstractLabel()
        configurePublishedOnLabel()
        setCellConstraints()
    }
    
    private func configureImageView() {
        thumbNail = UIImageView()
        thumbNail.backgroundColor = .lightGray
        thumbNail.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(thumbNail)
        thumbNail.contentMode = .scaleAspectFill
        thumbNail.layer.cornerRadius = CGFloat(SystemConstants.NewsFeed.thumbnailCornerRadius)
        thumbNail.clipsToBounds = true
    }
    
    private func configureHeadlineLabel() {
        headline = UILabel()
        headline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headline)
        headline.font = UIFont.boldSystemFont(ofSize: CGFloat(SystemConstants.NewsFeed.headlineFontSize))
        headline.textColor = .headlineBlack
        headline.textAlignment = .left
        headline.text = SystemConstants.NewsFeed.sampleHeadline
        headline.numberOfLines = SystemConstants.NewsFeed.headlineLines
    }
    
    private func configureAbstractLabel() {
        abstract = UILabel()
        abstract.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(abstract)
        abstract.font = UIFont.systemFont(ofSize: CGFloat(SystemConstants.NewsFeed.abstractFontSize))
        abstract.textColor = .abstractBlack
        abstract.textAlignment = .left
        abstract.text = SystemConstants.NewsFeed.sampleAbstract
        abstract.numberOfLines = SystemConstants.NewsFeed.abstractLines
    }
    
    private func configurePublishedOnLabel() {
        published = UILabel()
        published.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(published)
        published.font = UIFont.systemFont(ofSize: CGFloat(SystemConstants.NewsFeed.publishedOnSize))
        published.textColor = .publishedBlack
        published.textAlignment = .right
        published.numberOfLines = SystemConstants.NewsFeed.publishedOnLines
    }
    
    private func setCellConstraints() {
        setimageViewConstraints()
        setHeadlineLabelConstraints()
        setAbstractLabelConstraints()
        setPublishedOnLabelConstraints()
    }
    
    private func setimageViewConstraints() {
        
        NSLayoutConstraint.activate([
            thumbNail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: CGFloat(SystemConstants.NewsFeed.padding)),
            thumbNail.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: CGFloat(SystemConstants.NewsFeed.padding)),
            thumbNail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: CGFloat(-SystemConstants.NewsFeed.padding)),
            thumbNail.widthAnchor.constraint(equalTo: thumbNail.heightAnchor, multiplier: 1)
        ])
    }
    
    private func setHeadlineLabelConstraints() {
        NSLayoutConstraint.activate([
            headline.leadingAnchor.constraint(equalTo: thumbNail.trailingAnchor,
                                              constant: CGFloat(SystemConstants.NewsFeed.padding)),
            headline.topAnchor.constraint(equalTo: contentView.topAnchor,
                                          constant: CGFloat(SystemConstants.NewsFeed.padding)),
            headline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: CGFloat(-SystemConstants.NewsFeed.padding)),
        ])
    }
    
    private func setAbstractLabelConstraints() {
        NSLayoutConstraint.activate([
            abstract.leadingAnchor.constraint(equalTo: thumbNail.trailingAnchor,
                                              constant: CGFloat(SystemConstants.NewsFeed.padding)),
            abstract.topAnchor.constraint(equalTo: headline.bottomAnchor,
                                          constant: CGFloat(SystemConstants.NewsFeed.padding)),
            abstract.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: CGFloat(-SystemConstants.NewsFeed.padding)),
        ])
    }
    
    private func setPublishedOnLabelConstraints() {
        NSLayoutConstraint.activate([
            published.leadingAnchor.constraint(equalTo: thumbNail.trailingAnchor,
                                              constant: CGFloat(SystemConstants.NewsFeed.padding)),
            published.topAnchor.constraint(equalTo: abstract.bottomAnchor,
                                          constant: CGFloat(SystemConstants.NewsFeed.padding)),
            published.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: CGFloat(-SystemConstants.NewsFeed.padding)),
        ])
    }
}
