//
//  SuperViewController.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class SuperViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent(superView: UIView())
    }
    
    internal func initComponent(superView : UIView){
        view.addSubview(superView)
        superView.fillSuperview()
    }


}
