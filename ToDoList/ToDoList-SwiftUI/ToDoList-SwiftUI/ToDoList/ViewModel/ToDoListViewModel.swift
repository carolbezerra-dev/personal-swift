//
//  ToDoListViewModel.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import Foundation
import SwiftUI

class ToDoListViewModel: ObservableObject {

    private var userDefaultsHelper: UserDefaultsHelper
    @Published private(set) var toDoList: [Task] = []

    init() {

        userDefaultsHelper = UserDefaultsHelper()
        let savedList = userDefaultsHelper.getTasks()
        toDoList = savedList
    }

    func addNewTask(_ toDo: String) {

        toDo == "" ? nil : toDoList.append(Task(id: UUID(), value: toDo))
        userDefaultsHelper.addTask(toDoList)
    }

    func removeOne(_ toDo: IndexSet) {

        toDoList.remove(atOffsets: toDo)
        userDefaultsHelper.update(toDoList)
    }

    func removeAllTasks() {
        
        toDoList.removeAll()
        userDefaultsHelper.removeAll()
    }

}
