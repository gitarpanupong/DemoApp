//
//  CollectionMovieView.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class CollectionMovieView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        MovieDetailComponent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var collectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2.5, bottom: 0, right: 2.5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) //
        
        let size = (collectionView.frame.size.width - CGFloat(30)) / CGFloat(3)
        layout.itemSize = CGSize(width: size, height: size)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func MovieDetailComponent() {
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: bottomAnchor,
                              trailing: trailingAnchor,
                              padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }
    
  //  var delegate: MovieDetailProtocalDelegate?
    
    func detailPage() {
        
        
    }

    
    
    

}
