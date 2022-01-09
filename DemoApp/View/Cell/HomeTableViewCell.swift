//
//  HomeTableViewCell.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var getmovie: MovieDetail?
    
    internal var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    internal var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var releaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal var progressLoading: CircularProgressView = {
        let progressLoading = CircularProgressView()
        progressLoading.trackLineWidth = 4.0
        progressLoading.trackTintColor = UIColor.lightGray
        progressLoading.progressTintColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        progressLoading.roundedProgressLineCap = true
        
        progressLoading.translatesAutoresizingMaskIntoConstraints = false
        return progressLoading
    }()
    
    internal var percentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setComponent()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(movie: MovieDetail){
        nameLabel.text = movie.title
        releaseLabel.text = movie.release_date
        genreLabel.text = movie.overview
        percentLabel.text = "\(movie.vote_average ?? 0)"
        progressLoading.progress = (Float(movie.vote_average!) * 10)/100
        movieImageView.setImage(url: "https://image.tmdb.org/t/p/w500"+movie.poster_path!, placeholderImage: UIImage())
        
    }
    
    func setComponent(){
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(releaseLabel)
        contentView.addSubview(progressLoading)
        contentView.addSubview(percentLabel)
        
        movieImageView.anchor(top: contentView.topAnchor,
                              leading: contentView.leadingAnchor,
                              bottom: contentView.bottomAnchor,
                              padding: UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 0),
                              size: CGSize(width: 90, height: 0))
        
        nameLabel.anchor(leading: movieImageView.trailingAnchor,
                         bottom: genreLabel.topAnchor,
                         trailing: progressLoading.leadingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 10, bottom: 20, right: 0))
        
        genreLabel.anchor(leading: movieImageView.trailingAnchor,
                            trailing: progressLoading.leadingAnchor,
                            centerY: contentView.centerYAnchor,
                            padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        
        
        releaseLabel.anchor(top: genreLabel.bottomAnchor,
                            leading: movieImageView.trailingAnchor,
                            trailing: progressLoading.leadingAnchor,
                            padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0))
        
        progressLoading.anchor(trailing: contentView.trailingAnchor,
                               centerY: contentView.centerYAnchor,
                               padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10),
                               size: CGSize(width: 50, height: 50))
        
        percentLabel.anchor(leading: progressLoading.leadingAnchor,
                             trailing: progressLoading.trailingAnchor,
                             centerY: contentView.centerYAnchor)
    }
    
    
}
