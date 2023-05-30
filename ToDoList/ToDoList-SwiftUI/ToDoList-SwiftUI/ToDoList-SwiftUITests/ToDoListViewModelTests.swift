//
//  ToDoListViewModelTests.swift
//  ToDoList-SwiftUITests
//
//  Created by Carol Bezerra on 30/05/23.
//

import XCTest
@testable import ToDoList_SwiftUI

final class ToDoListViewModelTests: XCTestCase {

    private var toDoListViewModel: ToDoListViewModel!
    private var toDoList: [Task] = []

    // MARK: - Settings

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        toDoListViewModel = ToDoListViewModel()
        toDoList = [
            Task(id: UUID(), value: "study Swift", completed: false),
            Task(id: UUID(), value: "LinkedIn post", completed: false)
        ]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        toDoListViewModel = nil
        toDoList = []
    }

    // MARK: - Add Method

    func testAdd_shouldNotAddEmptyTask() {
        // GIVEN THE TASK IS EMPTY
        let value = ""

        // WHEN TAP ON ADD BUTTON
        toDoListViewModel.addNewTask(value)

        // THEN TASK IS NOT ADDED IN TODOLIST
        XCTAssertEqual(toDoList.count, 2)
        XCTAssertEqual(toDoList.last?.value, "LinkedIn post")
    }

    func testAdd_shouldAddNewTask() {
        // GIVEN USER WRITE A TASK
        let value = "read book chapter"

        // WHEN TAP ON ADD BUTTON
        toDoListViewModel.addNewTask(value)
        print(toDoList)

        // THEN TASK IS ADDED IN TODOLIST
        XCTAssertEqual(toDoList.count, 3)
        XCTAssertEqual(toDoList.last?.value, "read book chapter")
    }

    // MARK: - Update Method

    func testUpdate_shouldUpdateTaskWhenCompleted() {
        // GIVEN THE TASK IS COMPLETED
        var task = toDoList[0]
        task.completed = true

        // WHEN USER MAKES A LONG PRESS
        toDoListViewModel.update(toDo: task)

        // THEN TASK IS UPDATED IN TODOLIST
        XCTAssertTrue(toDoList[0].completed)
    }

    // MARK: - RemoveOne Method

    func testRemoveOne_shoulRemoveASpecificTask() {
        // GIVEN TODOLIST HAS AT LEAST 1 TASK
        XCTAssertEqual(toDoList.count, 2)

        // WHEN USER SWIPE TO DELETE
//        toDoListViewModel.removeOne() o que colocar como parâmetro?

        // THEN THIS SPECIFIC TASK IS DELETED
        XCTAssertEqual(toDoList.count, 1)
    }

    // MARK: - RemoveAll Method

    func testRemoveAll_shouldEmptyToDoList() {
        // GIVEN TODOLIST HAS AT LEAST 1 TASK
        XCTAssertEqual(toDoList.count, 2)

        // WHEN TAP ON IT'S DONE BUTTON
        toDoListViewModel.removeAllTasks()

        // THEN THIS SPECIFIC TASK IS DELETED
        XCTAssertEqual(toDoList.count, 0)
    }
}
