//
//  ResultsScreenPresenter.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import UIKit

protocol ResultsScreenPresenter: class {
    var searchData: SearchData { get }
    var dataCount: Int { get }


    init (view: ResultsScreenView,
          searchData: SearchData)
    
    func viewDidLoad()
    
    func getNameForCell(row: Int) -> String
    
    func getDetailTextForCell(row: Int) -> String
}
