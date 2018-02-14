//
//  ApiGateway.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

protocol ApiRequestPresenter {
    func displayError(error: Error)
    func downloadSuccess(data: Data)
}

protocol GatewayProtocol {
    func fetchResources(urlString: String,
                        completionHandler: @escaping ((Data?, Error?) -> ()))
}

class ApiGateway: GatewayProtocol {
    var setailData: SearchData?
    
    func fetchResources(urlString: String,
                        completionHandler: @escaping ((Data?, Error?) -> ())) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            
            if let data = data  {
                completionHandler(data, nil)
            }
            }.resume()
    }
}
