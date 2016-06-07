//
//  UndoHistoryTDDTests.swift
//  UndoHistoryTDDTests
//
//  Created by Bojan Stefanovic on 2016-06-06.
//  Copyright © 2016 Bojan Stefanovic. All rights reserved.
//

import XCTest
@testable import UndoHistoryTDD

class UndoHistoryTDDTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_setInitialValueNotNil() {
        let undoList = UndoHistory(initialValue: 0)
        XCTAssertNotNil(undoList)
    }

    func test_setInitialValueToEmptyArrayNotNil() {
        let undoList = UndoHistory(initialValue: [])
        XCTAssertNotNil(undoList)
    }

    func test_emptyIntArrayNotNil() {
        let emptyIntArray = [Int]()
        let undoList = UndoHistory(initialValue: emptyIntArray)
        XCTAssertNotNil(undoList)
    }

    func test_setNewValue() {
        var undoList = UndoHistory(initialValue: 0)
        undoList.currentItem = 1337
        XCTAssertEqual(undoList.currentItem, 1337)
    }

    func test_setNewArrayValue() {
        var undoList = UndoHistory(initialValue: [1, "a"])
        undoList.currentItem = [2, "b"]
        XCTAssertEqual(undoList.currentItem, [2, "b"])
    }

    func test_newValueAndUndo() {
        var undoList = UndoHistory(initialValue: 1)
        undoList.currentItem = 2
        XCTAssertEqual(undoList.currentItem, 2)
        undoList.undo()
        XCTAssertEqual(undoList.currentItem, 1)
    }

    func test_undoPastInitialValues() {
        var undoList = UndoHistory(initialValue: [1, 2])
        undoList.currentItem = [5, 4, 3, 2, 1]
        XCTAssertEqual(undoList.currentItem, [5, 4, 3, 2, 1])
        undoList.undo()
        XCTAssertEqual(undoList.currentItem, [1, 2])
        undoList.undo()
        XCTAssertEqual(undoList.currentItem, [1, 2])
    }
}
