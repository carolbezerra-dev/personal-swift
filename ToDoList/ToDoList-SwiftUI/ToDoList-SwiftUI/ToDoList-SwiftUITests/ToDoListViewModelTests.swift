//
//  ToDoListViewModelTests.swift
//  ToDoList-SwiftUITests
//
//  Created by Carol Bezerra on 30/05/23.
//

@testable import ToDoListViewModel
import XCTest

final class ToDoListViewModelTests: XCTestCase {

    private var toDoListViewModel: ToDoListViewModel!
    private var toDoList: [Task] = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUpWithError()
        toDoListViewModel = ToDoListViewModel()
        toDoList = [
            Task(id: UUID(), value: "study Swift", completed: false),
            Task(id: UUID(), value: "LinkedIn post", completed: false)
        ]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        toDoListViewModel = nil
        toDoList = []
        super.tearDownWithError()
    }

    func testAdd_shouldAddNewTaskInToDoList() {
        // GIVEN USER WRITE A TASK
        let value = "read book chapter"

        // WHEN TAP ON ADD BUTTON
        toDoListViewModel.addNewTask(value)

        // THEN TASK IS ADDED IN TODOLIST
        XCTAssertEqual(toDoList.count, 3)
        XCTAssertEqual(toDoList.last.value, "read book chapter")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
