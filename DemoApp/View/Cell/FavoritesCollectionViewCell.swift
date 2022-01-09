//
//  FavoritesCollectionViewCell.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit
import CollectionViewSlantedLayout
let yOffsetSpeed: CGFloat = 100.0
let xOffsetSpeed: CGFloat = 100.0

class FavoritesCollectionViewCell: CollectionViewSlantedCell {

    private var gradient = CAGradientLayer()
    
    internal var imageMovie: UIImageView = {
        let imagemovie = UIImageView()
        imagemovie.translatesAutoresizingMaskIntoConstraints = false
        imagemovie.alpha = 0.4
        return imagemovie
    }()
    
    internal var nameMovie: UILabel = {
        let nameMovie = UILabel()
        nameMovie.translatesAutoresizingMaskIntoConstraints = false
        nameMovie.textColor = .white
        nameMovie.textAlignment = .center
        nameMovie.font = UIFont.boldSystemFont(ofSize: 16)
        
        return nameMovie
    }()
    
    var imageHeight: CGFloat {
        return (imageMovie.image?.size.height) ?? 0.0
    }

    var imageWidth: CGFloat {
        return (imageMovie.image?.size.width) ?? 0.0
    }

    func offset(_ offset: CGPoint) {
        imageMovie.frame = imageMovie.bounds.offsetBy(dx: offset.x, dy: offset.y)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if let backgroundView = backgroundView {
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.frame = backgroundView.bounds
            backgroundView.layer.addSublayer(gradient)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let backgroundView = backgroundView {
            gradient.frame = backgroundView.bounds
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        SetComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(movieDetail: MovieDetail){
        nameMovie.text = movieDetail.title
        imageMovie.setImage(url: "https://image.tmdb.org/t/p/w500"+(movieDetail.poster_path!), placeholderImage: UIImage())
    }
    
    func SetComponent(){
        contentView.addSubview(imageMovie)
        contentView.addSubview(nameMovie)
        
        imageMovie.anchor(top: contentView.topAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor)
        
        nameMovie.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor)
    }

//    var image: UIImage = UIImage() {
//        didSet {
//            imageView.image = image
//        }
//    }

}
