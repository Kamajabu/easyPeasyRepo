//
//  SearchScreenElements.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import SBTUITestTunnel

struct SearchScreenElements: TunneledApplicationAware {
    static let instance = SearchScreenElements()
    
    var searchInput: XCUIElement {
        return app.textFields[ProfileIdentifiers.SearchScreen.searchField].firstMatch
    }
    
//    (self.app.textFields["Enter text here"].waitForExistence(timeout: 2))
}
