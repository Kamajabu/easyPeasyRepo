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
            
            let firstCellElementPainted = resultsScreenElements.getCellForIndexOfTable(table: parentTableView, index: 0, color: .red)
            XCTAssert(firstCellElementPainted.waitForExistence(timeout: 2))
            
            let secondCellElementPainted = resultsScreenElements.getCellForIndexOfTable(table: parentTableView, index: 1, color: .yellow)
            XCTAssert(secondCellElementPainted.waitForExistence(timeout: 2))

            let thirdCellElementPainted = resultsScreenElements.getCellForIndexOfTable(table: parentTableView, index: 2, color: .green)
            XCTAssert(thirdCellElementPainted.waitForExistence(timeout: 2))
        }
    }
    
    func testThatThereIsNoMoreCells() {
        let parentTableView = resultsScreenElements.resultsTable

        let sixthCell = resultsScreenElements.getCellForIndexOfTable(table: parentTableView, index: 6)
        XCTAssertFalse(sixthCell.waitForExistence(timeout: 2))
    }
    
    func testDisplayedCellsNumber() {
        let parentTableView = resultsScreenElements.resultsTable
        waitForElementToAppear(parentTableView)

        let cells = resultsScreenElements.getAllCellsForTable(table: parentTableView)
        XCTAssertTrue(cells.count == 5)
    }
    
    func waitForElementToAppear(_ element: XCUIElement) {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate,
                                                    object: element)
        
        XCTWaiter().wait(for: [expectation], timeout: 2)
    }
}
