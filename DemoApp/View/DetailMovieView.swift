//
//  DetailMovieView.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit
protocol DetailMovieViewProtocalDelegate {
    func didSelectReviews()
}

class DetailMovieView: UIView {
    
    internal var backDropImage: UIImageView = {
        var backDropImage = UIImageView()
        backDropImage.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        backDropImage.contentMode = .scaleAspectFill
        backDropImage.translatesAutoresizingMaskIntoConstraints = false
        return backDropImage
    }()
    
    internal var posterImage: UIImageView = {
        var posterImage = UIImageView()
        posterImage.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.layer.cornerRadius = 20
        posterImage.layer.masksToBounds = true
        return posterImage
    }()
    
    
    internal var movienamelbl: UILabel = {
        let label = UILabel()
        label.text = "The Avengers"
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        // label.font = UIFont.systemFont(ofSize: 10)
        label.text = "7.5"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!"
        label.textColor = .cyan
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15.0
        stackView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stackView.layer.borderWidth = 0.5
        //        stackView.distribution = .fillEqually
        
        // stackView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
        
    }()
    
    internal var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Release Date \n\n 2018-01-01"
        label.numberOfLines = 0
        label.textColor = .white
        label.sizeToFit()
        
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var detailMovie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.backgroundColor = .clear
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 16)
        //    textView.isEditable = false
        //label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = #colorLiteral(red: 0.0863005648, green: 0.0863005648, blue: 0.0863005648, alpha: 1)
        return scrollView
    }()
    
    internal var reviewButton: UIButton = {
        let button = UIButton()
        //reviewimage.image = #imageLiteral(resourceName: "Review")
        button.setTitle("Review", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(TappedReviews), for: .touchUpInside)
        return button
    }()
    
    internal var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.0863005648, green: 0.0863005648, blue: 0.0863005648, alpha: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    internal var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    internal var textField2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    internal var collectionCast: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/4 - 10, height: 200)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        let coll = UICollectionView.initCollectionView(frame: .zero, layout: flowLayout, showVerticalScroll: false, backgroundColor: .clear)
        return coll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetViewCoponent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(movieDetail: MovieDetail?){
        movienamelbl.text = movieDetail?.original_title
        detailMovie.text = "\t\(movieDetail?.overview ?? "")"
        percentLabel.text = "\(Float((movieDetail?.vote_average)!))"
        progressLoading.progress = (Float((movieDetail?.vote_average!)!) * 10)/100
        releaseDateLabel.text = "Release Date\n\n\(movieDetail!.release_date!)"
        posterImage.setImage(url: "https://image.tmdb.org/t/p/w500"+(movieDetail?.poster_path)!, placeholderImage: UIImage())
        backDropImage.setImage(url: "https://image.tmdb.org/t/p/w500"+(movieDetail?.backdrop_path)!, placeholderImage: UIImage())
    }
    
    func SetViewCoponent() {
        
        let frameGuide = scrollView.frameLayoutGuide
        let contentGuide = scrollView.contentLayoutGuide
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backDropImage)
        contentView.addSubview(posterImage)
        contentView.addSubview(movienamelbl)
        contentView.addSubview(progressLoading)
        contentView.addSubview(reviewButton)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(detailMovie)
        
        progressLoading.addSubview(percentLabel)
        contentView.addSubview(collectionCast)
        
        NSLayoutConstraint.activate([
            frameGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameGuide.topAnchor.constraint(equalTo: topAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentGuide.widthAnchor.constraint(equalTo: frameGuide.widthAnchor),
        ])
        
        backDropImage.anchor(top: contentView.topAnchor,
                             leading: contentView.leadingAnchor,
                             trailing: contentView.trailingAnchor,
                             size: CGSize(width: 0, height: 200))
        
        posterImage.anchor(leading: backDropImage.leadingAnchor,
                           bottom: backDropImage.bottomAnchor,
                           padding: UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 0),
                           size: CGSize(width: 100, height: 150))
        
        movienamelbl.anchor(top: backDropImage.bottomAnchor,
                            leading: contentView.leadingAnchor,
                            trailing: progressLoading.leadingAnchor,
                            padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 10))
        
        progressLoading.anchor(top: backDropImage.bottomAnchor,
                               trailing: contentView.trailingAnchor,
                               padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 20),
                               size: CGSize(width: 50, height: 50))
        
        percentLabel.anchor(top: progressLoading.topAnchor,
                            leading: progressLoading.leadingAnchor,
                            bottom: progressLoading.bottomAnchor,
                            trailing: progressLoading.trailingAnchor)
        
        reviewButton.anchor(top: progressLoading.bottomAnchor,
                            trailing: contentView.trailingAnchor,
                            padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 16),
                            size: CGSize(width: 80, height: 50))
        
        releaseDateLabel.anchor(top: progressLoading.bottomAnchor,
                                leading: contentView.leadingAnchor,
                                trailing: contentView.trailingAnchor,
                                padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        
        detailMovie.anchor(top: releaseDateLabel.bottomAnchor,
                           leading: contentView.leadingAnchor,
                           bottom: collectionCast.topAnchor,
                           trailing: contentView.trailingAnchor,
                           padding: UIEdgeInsets(top: 10, left: 16, bottom: 16, right: 16))
        
        collectionCast.anchor(leading: contentView.leadingAnchor,
                              bottom: contentView.bottomAnchor,
                              trailing: contentView.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 16, bottom: 20, right: 16),
                              size: CGSize(width: 0, height: 150))
        
    }
    
    var delegate: DetailMovieViewProtocalDelegate?
    
    @objc func TappedReviews()
    {
        delegate?.didSelectReviews()
    }
    
}
