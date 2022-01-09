//
//  ReviewTableViewCell.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellComponent()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(reviewData: ReviewContent){
        NameLabel.text = reviewData.author
        ReviewLabel.text = reviewData.content
    }
    
    internal var NameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    internal var ReviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    
    func cellComponent() {
        contentView.addSubview(NameLabel)
        contentView.addSubview(ReviewLabel)
        NameLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10),
                         size: CGSize(width: 0, height: 20))
        
        ReviewLabel.anchor(top: NameLabel.bottomAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: UIEdgeInsets(top: 16, left: 5, bottom: -5, right: 10))
    }
    
}
