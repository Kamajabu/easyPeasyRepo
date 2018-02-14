//
//  SearchScreenConfigurator.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//


import Foundation

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
