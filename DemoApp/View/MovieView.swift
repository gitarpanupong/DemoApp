//
//  MovieView.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class MovieView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal var tableView: UITableView = {
        var tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 150
        
        
        return tableview
    }()
    
    internal var floatingButton: UIButton = {
        var floatingButton = UIButton()
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        return floatingButton
    }()
    
    func registerComponent(){
        addSubview(tableView)
        addSubview(floatingButton)
        tableView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor)
        
        floatingButton.anchor(bottom: bottomAnchor,
                              trailing: trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 30))
        
    }
}
