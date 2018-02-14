//
//  LoginScreenPresenter.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation


protocol SearchScreenPresenter: class {
    init (view: SearchScreenView,
          apiGateway: ApiGateway,
          deserializer: Deserializer)
    
    func viewDidLoad()
}
