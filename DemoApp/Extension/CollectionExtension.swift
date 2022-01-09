//
//  CollectionExtension.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

extension UICollectionView {
    class func initCollectionView(frame: CGRect,layout: UICollectionViewLayout,showVerticalScroll: Bool,backgroundColor: UIColor) -> UICollectionView {
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = showVerticalScroll
        collectionView.showsHorizontalScrollIndicator = showVerticalScroll
        collectionView.backgroundColor = backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    return collectionView
    }
    
}
