//
//  CastCollectionViewCell.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    internal var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatar")
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    internal var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetComponent(){
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        
        profileImage.anchor(top: contentView.topAnchor,
                            leading: contentView.leadingAnchor,
                            bottom: nameLabel.topAnchor,
                            trailing: contentView.trailingAnchor,
                            padding: UIEdgeInsets(top: 25, left: 5, bottom: 0, right: 5))

        nameLabel.anchor(leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0),
                         size: CGSize(width: 0, height: 40))
    }
    
}
