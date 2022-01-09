//
//  AccountViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit
import CollectionViewSlantedLayout

class AccountViewController: SuperViewController {
    
     var collectionViewLayout: CollectionViewSlantedLayout!
    
    internal var favoritesView: AccountView = {
        let favoritesView = AccountView()
        favoritesView.translatesAutoresizingMaskIntoConstraints = false
        favoritesView.collectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return favoritesView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent(superView: favoritesView)
        favoritesView.collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "accountcell")
        favoritesView.collectionView.delegate = self
        favoritesView.collectionView.dataSource = self
        navigationItem.title = "Favorites"
        favoritesView.collectionView.reloadData()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.favoritesView.collectionView.reloadData()
            self.favoritesView.collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension AccountViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserDefault.getFavorite().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "accountcell", for: indexPath) as! FavoritesCollectionViewCell
        
        cell.setData(movieDetail: UserDefault.getFavorite()[indexPath.row])
        
        if let layout = collectionView.collectionViewLayout as? CollectionViewSlantedLayout {
            layout.isFirstCellExcluded = true
            layout.isLastCellExcluded = true
            layout.lineSpacing = 15
            layout.itemSize = 230
        }
        return cell
    }
    
}

extension AccountViewController: UIScrollViewDelegate,CollectionViewDelegateSlantedLayout,UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let collectionView = favoritesView.collectionView
        guard let visibleCells = collectionView.visibleCells as? [FavoritesCollectionViewCell] else {return}
        for parallaxCell in visibleCells {
            let yOffset = (collectionView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.imageHeight
            let xOffset = (collectionView.contentOffset.x - parallaxCell.frame.origin.x) / parallaxCell.imageWidth
            parallaxCell.offset(CGPoint(x: xOffset * xOffsetSpeed, y: yOffset * yOffsetSpeed))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailMovieViewController(getMovieModel: UserDefault.getFavorite()[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: CollectionViewSlantedLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGFloat {
        return collectionViewLayout.scrollDirection == .vertical ? 275 : 325
    }
    
}
