//
//  ResultsScreenElements.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 15/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import SBTUITestTunnel

struct ResultsScreenElements: TunneledApplicationAware {
    static let instance = ResultsScreenElements()
    
    var resultsTable: XCUIElement {
        return app.tables[ProfileIdentifiers.ResultsScreen.resultsTable].firstMatch
    }
    
    func getCellForIndexOfTable(table: XCUIElement, index: Int, color: UIColor? = nil) -> XCUIElement {
        let identifierWithIndex = "\(ProfileIdentifiers.ResultsScreen.resultsCell)\(index)"

        if (color != nil ) {
            return table.cells.element(matching: .cell, identifier: identifierWithIndex)
        } else {
            let colorDescription = color?.debugDescription
            let identifierWithColor = "\(ProfileIdentifiers.ResultsScreen.resultsCell)\(index)_\(colorDescription)"

            return table.cells.element(matching: .cell, identifier: identifierWithColor)
        }
    }
}

