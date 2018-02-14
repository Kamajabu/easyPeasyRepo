//
//  SearchScreenConfigurator.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//


import Foundation

struct SearchScreenConsts {
    static let masterEndpoint = "https://api.github.com/search"
    static let repositoryQuery = "/repositories?q="
    static let cellHeight: Float = 40
    
    static let detailSegue = "showDetail"
    static let cellIdentifier = "masterCell"
}

protocol SearchScreenConfigurator {
    func configure(searchScreenViewImplementation: SearchScreenViewImplementation)
}

class SearchScreenConfiguratorImplementation: SearchScreenConfigurator {
    func configure(searchScreenViewImplementation: SearchScreenViewImplementation) {
        let apiGateway = ApiGateway()
        let deserializer = Deserializer()
        
        searchScreenViewImplementation.presenter = SearchScreenPresenterImplementation(
            view: searchScreenViewImplementation,
            apiGateway: apiGateway,
            deserializer: deserializer)
    }
}
