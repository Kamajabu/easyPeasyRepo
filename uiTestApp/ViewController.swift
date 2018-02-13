//
//  ViewController.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 13/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {
    
    var headerView: UIView!

    fileprivate lazy var userInfoLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
    }()
    
    
    fileprivate lazy var layout: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize views and add them to the ViewController's view
        setupHeaderAndTitleLabel()
        self.view.backgroundColor = .white
        
        self.userInfoLabel.text = "test"
        self.view.addSubview(self.userInfoLabel)
        
        self.userInfoLabel <- [
        Height(20),
        Top(60).to(self.view),
        Left(20).to(self.view),
        Right(20).to(self.view)
        ]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeaderAndTitleLabel() {
        // Initialize views and add them to the ViewController's view
        headerView = UIView()
        headerView.backgroundColor = .red
        self.view.addSubview(headerView)
        
        // Set position of views using constraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
    }



}

