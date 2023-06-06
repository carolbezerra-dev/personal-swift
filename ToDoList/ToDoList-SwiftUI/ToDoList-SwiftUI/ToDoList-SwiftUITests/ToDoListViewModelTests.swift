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
    private var userDefaultsMock: UserDefaultsHelperMock!
    private var toDoCellView: ToDoCellView!

    // MARK: - Settings

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userDefaultsMock = UserDefaultsHelperMock()
        toDoListViewModel = ToDoListViewModel(userDefaults: userDefaultsMock)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userDefaultsMock = nil
        toDoListViewModel = nil
        toDoCellView = nil
    }

    // MARK: - Add Method

    func testAdd_shouldNotAddEmptyTask() {
        // GIVEN THE TASK IS EMPTY
        let value = ""

        // WHEN TAP ON ADD BUTTON
        toDoListViewModel.addNewTask(value)

        // THEN TASK IS NOT ADDED IN TODOLIST
        XCTAssertEqual(toDoListViewModel.toDoList.count, 0)
    }

    func testAdd_shouldAddNewTask() {
        // GIVEN USER WRITE A TASK
        let value = "read book chapter"

        // WHEN TAP ON ADD BUTTON
        toDoListViewModel.addNewTask(value)

        // THEN TASK IS ADDED IN TODOLIST
        XCTAssertEqual(toDoListViewModel.toDoList.count, 1)
        XCTAssertEqual(toDoListViewModel.toDoList.first?.value, "read book chapter")
    }

    // MARK: - Update Method

    func testUpdate_shouldUpdateTaskWhenCompleted() {
        // GIVEN TODOLIST HAS AT LEAST 1 TASK
        let value = "study graduate course"
        toDoListViewModel.addNewTask(value)
        XCTAssertEqual(toDoListViewModel.toDoList.count, 1)

        // AND THIS ONE IS COMPLETED
        toDoCellView = ToDoCellView(task: toDoListViewModel.toDoList.first!)
        toDoCellView.longPressPerform()
        toDoCellView.completed = true
//        toDoListViewModel.toDoList.first!.completed = true
        // como simular gesture?

        // WHEN USER MAKES A LONG PRESS
        toDoListViewModel.update(toDo: toDoListViewModel.toDoList.first!)

        // THEN TASK IS UPDATED IN TODOLIST
        print("TASK")
        print(toDoListViewModel.toDoList.first!)
        XCTAssertTrue(toDoListViewModel.toDoList.first!.completed)
    }

    // MARK: - RemoveOne Method

    func testRemoveOne_shoulRemoveTheOnlyTask() {
        // GIVEN TODOLIST HAS AT LEAST 1 TASK
        let value = "get ready to interview"
        toDoListViewModel.addNewTask(value)
        XCTAssertEqual(toDoListViewModel.toDoList.count, 1)

        // WHEN USER SWIPE TO DELETE
        toDoListViewModel.removeOne(IndexSet(toDoListViewModel.toDoList))

        // THEN THE TASK IS DELETED
        XCTAssertEqual(toDoListViewModel.toDoList.count, 0)
    }

    func testRemoveOne_shoulRemoveASpecificTask() {
        // GIVEN TODOLIST HAS 3 TASKS
        var value = "read book chapter"
        toDoListViewModel.addNewTask(value)

        value = "read book chapter"
        toDoListViewModel.addNewTask(value)

        value = "get ready to interview"
        toDoListViewModel.addNewTask(value)

        XCTAssertEqual(toDoListViewModel.toDoList.count, 3)

        // WHEN USER SWIPE TO DELETE A SPECIFIC TASK
//        toDoListViewModel.removeOne() o que colocar como parâmetro?

        // THEN THIS SPECIFIC TASK IS DELETED
        XCTAssertEqual(toDoListViewModel.toDoList.count, 2)
        XCTAssertTrue(toDoListViewModel.toDoList.first?.value == "read book chapter")
        XCTAssertTrue(toDoListViewModel.toDoList.last?.value == "get ready to interview")
        XCTAssertFalse(toDoListViewModel.toDoList[1].value == "read book chapter")
    }

    // MARK: - RemoveAll Method

    func testRemoveAll_shouldEmptyToDoList() {
        // GIVEN TODOLIST HAS AT LEAST 1 TASK
        let value = "watch wwdc recording"
        toDoListViewModel.addNewTask(value)
        XCTAssertEqual(toDoListViewModel.toDoList.count, 1)

        // WHEN TAPPING ON IT'S DONE BUTTON
        toDoListViewModel.removeAllTasks()

        // THEN TODOLIST IS EMPTYED
        XCTAssertEqual(toDoListViewModel.toDoList.count, 0)
    }
}
