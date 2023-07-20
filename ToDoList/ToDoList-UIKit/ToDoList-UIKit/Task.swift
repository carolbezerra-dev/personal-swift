//
//  Task.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 20/07/23.
//

import Foundation

class Task {
    var taskName: String
    var isTaskSelected: Bool = false
    var isTaskCompleted: Bool = false

    init(taskName: String) {
        self.taskName = taskName
    }
}
