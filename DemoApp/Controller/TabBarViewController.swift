//
//  TabBarViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let tabPopularMovies = UINavigationController(rootViewController: HomeViewController())
        let tabPopularMoviesbarItem = UITabBarItem(title: "Popular Movies", image: UIImage(named: "movie"), tag: 1)
        tabPopularMovies.tabBarItem = tabPopularMoviesbarItem
        
        let tabFavorite = UINavigationController(rootViewController: AccountViewController())
        let tabFavoritebarItem =  UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 2)
        tabFavorite.tabBarItem = tabFavoritebarItem
        
        self.viewControllers = [tabPopularMovies,tabFavorite]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
          
    }
}
