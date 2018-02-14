//
//  ResultsScreenViewImplementation.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class ResultsScreenViewImplementation: UIViewController, ResultsScreenView {
    var configurator: ResultsScreenConfigurator!
    var presenter: ResultsScreenPresenter!
    
    fileprivate lazy var resultsTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(resultsScreenViewImplementation: self)
        
        self.setup()
    }
    
    fileprivate func setup() {
        self.view.backgroundColor = .white

        setupResultsTableView()
    }
    
    //MARK: ResultsTableView
    func setupResultsTableView() {
        self.view.addSubview(self.resultsTableView)

        //Constructing tableView.
        self.resultsTableView.delegate = self
        self.resultsTableView.dataSource = self
        
        self.resultsTableView.rowHeight = 50
        self.resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        positionResultsTableView()
    }
    
    func positionResultsTableView() {
        self.resultsTableView <- [
            Width().like(self.view),
            Height().like(self.view)
        ]
    }
}

extension ResultsScreenViewImplementation: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        cell.textLabel?.text =  presenter.getNameForCell(row: indexPath.row)
        cell.detailTextLabel?.text = presenter.getDetailTextForCell(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataCount
    }

}

