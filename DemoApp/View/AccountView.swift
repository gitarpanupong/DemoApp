//
//  AccountView.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit
import CollectionViewSlantedLayout

class AccountView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        FavoritesComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var collectionView: UICollectionView = {
        let slantedSayout = CollectionViewSlantedLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: slantedSayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    func FavoritesComponent() {
        addSubview(collectionView)
        collectionView.fillSuperview()
    }

}
