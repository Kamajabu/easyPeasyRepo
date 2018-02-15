//
//  ResultsScreenUITests.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 15/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import XCTest
import SBTUITestTunnel

class ResultsScreenUITests: XCTestCase {
    let resultsScreenElements = ResultsScreenElements.instance
    let searchScreenElements = SearchScreenElements.instance

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launchTunnel()
        
        let requestMatch = SBTRequestMatch.init(url: SearchScreenConsts.masterEndpoint)
        let returnedResponse = SBTStubResponse.init(fileNamed: TestConstants.Mock.githubResponse,
                                                    returnCode: 200,
                                                    responseTime: 2)
        let _ = app.stubRequests(matching: requestMatch,
                                 response: returnedResponse)
        
        XCTContext.runActivity(named: "Go to results screen") { _ in
            let enterTextHereTextField = searchScreenElements.searchInput
            enterTextHereTextField.tap()
            enterTextHereTextField.typeText("test")
            
            let searchButton = searchScreenElements.searchButton
            searchButton.tap()
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLayoutHasLoaded() {
        XCTContext.runActivity(named: "Table is visible") { _ in
            XCTAssert(resultsScreenElements.resultsTable.waitForExistence(timeout: 2))
        }
    }
    
    func testCellColors() {
        XCTContext.runActivity(named: "Table is visible") { _ in
            let parentTableView = resultsScreenElements.resultsTable
//            case 0:
//            cell.setBackgroundColor(.red)
//            case 1:
//            cell.setBackgroundColor(.yellow)
//            case 2:
//            cell.setBackgroundColor(.green)

            let firstCellElementPainted = resultsScreenElements.getCellForIndexOfTable(table: parentTableView, index: 0, color: .red)
            
            XCTAssert(firstCellElementPainted.waitForExistence(timeout: 2))

//            firstCellElement.children(matching: XCUIElement.ElementType)
            
            
        }
        
    }


    
}
