//
//  ReviewViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class ReviewViewController: SuperViewController {
    
    internal var reviewModel = ReviewDB()
    var getReview = [ReviewContent]()
    var id: Int?
    
    internal var reviewView: ReviewView = {
        let view = ReviewView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent(superView: reviewView)
        reviewView.tableView.delegate = self
        reviewView.tableView.dataSource = self
        reviewView.tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "REVIEWCELL")
        fetchData()
    }
    
    func fetchData(){
        reviewModel.getId(id: id ?? 0)
        reviewModel.handleManagementRequest { [self] demoModel in
            getReview = demoModel?.results ?? []
            reviewView.tableView.reloadData()
        }
    }
    
}

extension ReviewViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getReview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "REVIEWCELL", for: indexPath) as! ReviewTableViewCell
        cell.setData(reviewData: getReview[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
