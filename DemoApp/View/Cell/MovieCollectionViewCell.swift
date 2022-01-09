//
//  MovieCollectionViewCell.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    internal var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var imageMovie: UIImageView = {
        let imagemovie = UIImageView()
        imagemovie.translatesAutoresizingMaskIntoConstraints = false
        imagemovie.layer.cornerRadius = 20
        imagemovie.layer.masksToBounds = true
        return imagemovie
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetData(movie: MovieDetail){
        nameLabel.text = movie.title
        imageMovie.setImage(url: "https://image.tmdb.org/t/p/w500"+movie.poster_path!, placeholderImage: UIImage())

        
    }
    
    func SetComponent(){
        contentView.addSubview(imageMovie)
        contentView.addSubview(nameLabel)
        
        imageMovie.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: nameLabel.topAnchor,
                         trailing: contentView.trailingAnchor)
        
        nameLabel.anchor(leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor,
                         size: CGSize(width: 0, height: 20))
        
    }
    
    
}
