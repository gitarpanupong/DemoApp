//
//  DetailMovieViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class DetailMovieViewController: SuperViewController, DetailMovieViewProtocalDelegate {
    
    var getMovieModel: MovieDetail?
    var castService = CreditDB()
    var getCast = [CreditContent]()
    
    internal var detailMovieView: DetailMovieView = {
        var view = DetailMovieView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(getMovieModel: MovieDetail) {
        super.init(nibName: nil, bundle: nil)
        self.getMovieModel = getMovieModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent(superView: detailMovieView)
        detailMovieView.setData(movieDetail: getMovieModel)
        setNavigationBar()
        detailMovieView.delegate = self
        
        detailMovieView.collectionCast.delegate = self
        detailMovieView.collectionCast.dataSource = self
        detailMovieView.collectionCast.register(CastCollectionViewCell.self, forCellWithReuseIdentifier: "CASTCELL")
        fetchData()

        let Favorite = UserDefault.getFavorite()

        if Favorite.firstIndex(where: { $0.id == getMovieModel?.id }) != nil{
            navigationItem.rightBarButtonItems![0].tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else {
            navigationItem.rightBarButtonItems![0].tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }

    }
    
    func fetchData(){
        castService.getId(id: getMovieModel?.id ?? 0)
        castService.handleManagementRequest { [self] demoModel in
            getCast = demoModel?.cast ?? []
            detailMovieView.collectionCast.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() { //รอทำเสร็จ
        detailMovieView.backDropImage.diagonalImage()
        
        if detailMovieView.scrollView.contentSize.height <= view.frame.size.height {
            detailMovieView.scrollView.contentSize.height = view.frame.size.height-((tabBarController?.tabBar.frame.size.height)!)+2
        }

    }

    
    func setNavigationBar() {


        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        let FavoriteButton = UIBarButtonItem(image: UIImage(named: "heart"),  style: .plain, target: self, action: #selector(Favorites))

        navigationItem.rightBarButtonItems = [FavoriteButton,share]
        navigationItem.title = getMovieModel?.original_title
    }
    
    @objc func Favorites(sender: UIButton){
        switch (sender.tintColor){
        
        case #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):
            navigationItem.rightBarButtonItems![0].tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            Add()
        
        default:
            navigationItem.rightBarButtonItems![0].tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            Remove()
        }
    }
    
    func Add(){
        UserDefault.saveFavorite(movieDetail: getMovieModel!)
    }
    func Remove(){
       UserDefault.removeFavorite(id: (getMovieModel?.id)!)
    }
    
    @objc func shareTapped(sender: UIButton){

        guard let image = detailMovieView.posterImage.image?.jpegData(compressionQuality: 0.8) else {
              print("No image found")
              return
          }

        let object:URL = URL(string: "https://www.google.com/")!

          let vc = UIActivityViewController(activityItems: [object,image], applicationActivities: [])
          vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
          present(vc, animated: true)
    }

    func didSelectReviews() {
        let vc = ReviewViewController()
        vc.id = getMovieModel?.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DetailMovieViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CASTCELL", for: indexPath) as! CastCollectionViewCell
        
        cell.profileImage.setImage(url: "https://image.tmdb.org/t/p/w500"+(getCast[indexPath.row].profile_path ?? ""), placeholderImage: UIImage(named: "avatar"))
        cell.nameLabel.text = getCast[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90.0, height: 160.0)
    }
    
}
