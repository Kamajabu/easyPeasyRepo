//
//  ResultsScreenPresenterImplementation.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

class ResultsScreenPresenterImplementation: ResultsScreenPresenter {
    unowned let view: ResultsScreenView
    let searchData: SearchData
    
    var dataCount: Int {
        return searchData.items.count
    }
    
    required init(view: ResultsScreenView,
                  searchData: SearchData) {
        self.view = view
        self.searchData = searchData
    }
    
    func viewDidLoad() {
        
    }
    
    func getNameForCell(row: Int) -> String {
        let cellData = searchData.items[row]
                return cellData.name
    }
    
    func getDetailTextForCell(row: Int) -> String {
        let cellData = searchData.items[row]
        return cellData.full_name
    }
    
    func configureCell(cell: GithubRepoItemCell, row: Int) {
        let cellData = searchData.items[row]

        if(row == 0) {
        cell.setBackgroundColor(.red)
        } else {
            cell.setBackgroundColor(.green)
        }
        
        cell.setTitleLabel(content: cellData.name)
    }

}
