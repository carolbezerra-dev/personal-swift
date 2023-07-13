//
//  ViewModel.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 06/07/23.
//

import Foundation

class ViewModel {

    private var toDoList = [String]()

    func addTask(toDo: String) {
        toDo == "" ? nil : toDoList.append(toDo)
    }

    func getTasks() -> [String] {
        toDoList
    }

    func removeOne(_ index: Int) {
        toDoList.remove(at: index)    }

    func removeTasks() -> [String] {
        toDoList.removeAll()
        return toDoList
    }
}
