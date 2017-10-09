//
//  SpotOnTests.swift
//  SpotOnTests
//
//  Created by Adam on 2/26/17.
//  Copyright © 2017 LewPRO. All rights reserved.
//

import XCTest
@testable import SpotOn

class SpotOnTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testBoardLogic(){
        let context = setUpInMemoryManagedObjectContext()
        let board = Board(context: context)
        XCTAssertEqual(board.letterMask, 0)
        do{
            try board.togglePoint(atLetter: "L")
        } catch {
            XCTFail("Invalid Letter")
        }
        XCTAssertEqual(board.letterMask, 2048)
        do{
            try board.togglePoint(atLetter: "L")
        } catch {
            XCTFail("Invalid Letter")
        }
        XCTAssertEqual(board.letterMask, 0)
        do{
            try board.togglePoint(atLetter: "B")
        } catch {
            XCTFail("Invalid Letter")
        }
        XCTAssertEqual(board.letterMask, 2)
        board.resetBoard()
        XCTAssertEqual(board.letterMask, 0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
