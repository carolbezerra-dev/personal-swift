//
//  ViewModel.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 06/07/23.
//

import Foundation

class ViewModel {

    private var tasks = [String]()

    func addTask(toDo: String) {
        toDo == "" ? nil : tasks.append(toDo)
    }

    func getTasks() -> [String] {
        tasks
    }

    func removeTasks() -> [String] {
        tasks.removeAll()
        return tasks
    }
}
