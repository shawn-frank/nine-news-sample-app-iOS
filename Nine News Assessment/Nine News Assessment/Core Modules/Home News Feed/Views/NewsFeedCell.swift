//
//  NewsFeedCell.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import UIKit

class NewsFeedCell: UICollectionViewCell {
    static let identifier = "com.mindhyve.practice.nine-assessment.News-Feed-Cell"
    
    var thumbNail: UIImageView!
    var headline: UILabel!
    var abstract: UILabel!
    
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
        super.prepareForReuse()
    }
    
}

extension NewsFeedCell {
    
    // MARK: CONFIGURE LAYOUT
    private func configureCell() {
        contentView.backgroundColor = .white
        configureImageView()
        configureHeadlineLabel()
        configureAbstractLabel()
        setCellConstraints()
    }
    
    private func configureImageView() {
        thumbNail = UIImageView()
        thumbNail.backgroundColor = .gray
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
        headline.textAlignment = .left
        headline.text = SystemConstants.NewsFeed.sampleHeadline
        headline.numberOfLines = SystemConstants.NewsFeed.headlineLines
    }
    
    private func configureAbstractLabel() {
        abstract = UILabel()
        abstract.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(abstract)
        abstract.font = UIFont.systemFont(ofSize: CGFloat(SystemConstants.NewsFeed.abstractFontSize))
        abstract.textColor = .black
        abstract.textAlignment = .left
        abstract.text = SystemConstants.NewsFeed.sampleAbstract
        abstract.numberOfLines = SystemConstants.NewsFeed.abstractLines
    }
    
    private func setCellConstraints() {
        setimageViewConstraints()
        setHeadlineLabelConstraints()
        setAbstractLabelConstraints()
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
}
