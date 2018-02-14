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
    
    internal func downloadData() {
        apiGateway.fetchResources(urlString: SearchScreenConsts.masterEndpoint) { (data, error) in
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
