//
//  LoginScreenPresenterImplementation.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

class SearchScreenPresenterImplementation: SearchScreenPresenter {
    unowned let view: SearchScreenView
    let apiGateway: ApiGateway
    let deserializer: Deserializer
    
    required init(view: SearchScreenView,
                  apiGateway: ApiGateway,
                  deserializer: Deserializer) {
        self.view = view
        self.apiGateway = apiGateway
        self.deserializer = deserializer
    }
    
    func viewDidLoad() {
        
    }
    
    func downloadData(inputText: String?) {
        //Could be replaced by alamofire and parameters. Approach used here results in possible errors (white spaces etc.) but for now it's good enough
        if let searchText = inputText {
            let interpolatedUrl = SearchScreenConsts.masterEndpoint + SearchScreenConsts.repositoryQuery + searchText
            print(interpolatedUrl)
            fetchDataWithUrl(interpolatedUrl)
        }
    }
    
    func fetchDataWithUrl(_ passedUrlString: String) {
        apiGateway.fetchResources(urlString: passedUrlString) { (data, error) in
            guard error == nil else {
                let description = error?.localizedDescription
                //                self.view.displayErrorMessage(details: description ?? "-")
                return
            }
            
            if let recievedData = data {
                self.deserializeData(recievedData)
            }
        }
    }
    
    internal func deserializeData(_ recievedData: Data) {
        self.deserializer
            .decodeData(data: recievedData, dataType: SearchData.self,
                        Completion: { (data) in
                            self.goToDetailsScreen(fetchedData: data)
            })
    }
    
    internal func goToDetailsScreen(fetchedData: SearchData) {
        
    }
}
