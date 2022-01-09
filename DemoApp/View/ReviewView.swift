//
//  ReviewView.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class ReviewView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ReviewComponetnt()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func ReviewComponetnt() {
        addSubview(tableView)
        tableView.anchor(top: safeAreaLayoutGuide.topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
}
