//
//  ToDoListViewModel.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import Foundation
import SwiftUI

class ToDoListViewModel: ObservableObject {

    private var userDefaultsHelper: UserDefaultsHelperProtocol
    @Published private(set) var toDoList: [Task] = []

    init(userDefaults: UserDefaultsHelperProtocol = UserDefaultsHelper()) {
        self.userDefaultsHelper = userDefaults
        let savedList = userDefaultsHelper.getTasks()
        toDoList = savedList
    }

    func addNewTask(_ toDo: String) {
        toDo == "" ? nil : toDoList.append(Task(id: UUID(), value: toDo))
        userDefaultsHelper.add(toDoList)
    }

    func update(toDo: Task) {
        if let i = toDoList.firstIndex(of: toDo) {
            toDoList[i] = toDo
            userDefaultsHelper.update(toDoList)
        }
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
