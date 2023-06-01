//
//  UserDefaultsHelperMock.swift
//  ToDoList-SwiftUITests
//
//  Created by Ana Pedroso on 01/06/23.
//

@testable import ToDoList_SwiftUI

final class UserDefaultsHelperMock: UserDefaultsHelperProtocol {
    func add(_ toDoList: [ToDoList_SwiftUI.Task]) { }

    func getTasks() -> [ToDoList_SwiftUI.Task] {
        []
    }

    func update(_ toDoList: [ToDoList_SwiftUI.Task]) { }

    func removeAll() { }
}
