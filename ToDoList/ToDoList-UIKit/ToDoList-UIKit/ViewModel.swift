//
//  ViewModel.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 06/07/23.
//

import Foundation

class ViewModel {

    private var toDoList = [Task]()

    func addTask(toDo: String) {
        toDo == "" ? nil : toDoList.append(Task(taskName: toDo))
    }

    func getTasks() -> [Task] {
        toDoList
    }

    func removeOne(_ index: Int) {
        toDoList.remove(at: index)    }

    func removeTasks() -> [Task] {
        toDoList.removeAll()
        return toDoList
    }
}
