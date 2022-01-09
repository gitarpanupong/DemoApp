//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class HomeViewController: SuperViewController {
    
    internal var moviedbmodel = MovieDB()
    var getmovie = [MovieDetail]()
    var getresult = [MovieDetail]()
    let searchbar = UISearchBar()
    
    internal var homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    internal var movieCollectionlView: CollectionMovieView = {
        var movieDetailView = CollectionMovieView()
        movieDetailView.translatesAutoresizingMaskIntoConstraints = false
        movieDetailView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return movieDetailView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetCollection()
        SetHome()
        fetch()
    }
    
    func SetHome(){
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HOMECELL")
        navigationItem.title = "Popular Movies"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.tabBarController?.tabBar.backgroundColor = .systemBlue
        navigationController?.tabBarController?.tabBar.tintColor = .white
        navigationController?.tabBarController?.tabBar.unselectedItemTintColor = .darkGray
        
        let FavoriteButton = UIBarButtonItem(image: UIImage(named: "grid"),  style: .plain, target: self, action: #selector(ChangeLayout))
        
        navigationItem.rightBarButtonItems = [FavoriteButton]
        // navigationItem.title = getMovieModel?.original_title
        
        initComponent(superView: homeView)
    }
    
    func SetCollection(){

        navigationItem.title = "Upcoming Movies"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(ShowSearchbar))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        searchbar.sizeToFit()
      //  searchbar.delegate = self
        
        movieCollectionlView.collectionView.delegate = self
        movieCollectionlView.collectionView.dataSource = self
        movieCollectionlView.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "movieDetailCell")
        initComponent(superView: movieCollectionlView)
    }
    
    @objc func ShowSearchbar(){
        navigationItem.titleView = searchbar
        searchbar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchbar.showsCancelButton = true
        searchbar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchbar.becomeFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    func fetch(){
        moviedbmodel.handleManagementRequest { [self] (Item) in
            getresult = Item!.items!
            getmovie = getresult
            homeView.tableView.reloadData()
        }
    }
    
    @objc func ChangeLayout(sender: UIButton){
        
        switch homeView.isHidden {
        case true:
            navigationItem.rightBarButtonItems![0].image = UIImage(named: "grid")
            movieCollectionlView.isHidden = true
            homeView.isHidden = false
            homeView.tableView.reloadData()
        default:
            navigationItem.rightBarButtonItems![0].image = UIImage(named: "list")
            homeView.isHidden = true
            movieCollectionlView.isHidden = false
            movieCollectionlView.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getmovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HOMECELL", for: indexPath) as! HomeTableViewCell
        cell.setData(movie: getmovie[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailMovieViewController(getMovieModel: getmovie[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getmovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieDetailCell", for: indexPath) as! MovieCollectionViewCell
        cell.SetData(movie: getmovie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailMovieViewController(getMovieModel: getmovie[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 150);
    }
    
    
    
}
