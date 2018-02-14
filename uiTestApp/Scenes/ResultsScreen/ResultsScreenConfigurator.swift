//
//  ResultsScreenConfigurator.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

import Foundation

struct ResultsScreenConsts {
    static let cellHeight: Float = 40
    
    static let detailSegue = "showDetail"
    static let cellIdentifier = "masterCell"
}

protocol ResultsScreenConfigurator {
    func configure(resultsScreenViewImplementation: ResultsScreenViewImplementation)
}

class ResultsScreenConfiguratorImplementation: ResultsScreenConfigurator {
    let passedSearchData: SearchData
    
    required init(searchData: SearchData) {
        passedSearchData = searchData
    }
    
    func configure(resultsScreenViewImplementation: ResultsScreenViewImplementation) {
        resultsScreenViewImplementation.presenter = ResultsScreenPresenterImplementation(
            view: resultsScreenViewImplementation,
            searchData: passedSearchData)
    }
}
