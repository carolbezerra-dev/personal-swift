//
//  Task.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import Foundation

struct Task: Codable, Equatable {

    let id: UUID
    let value: String
    var completed: Bool = false

    // Definition of Equatable to use in comparison
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id && lhs.value == rhs.value
    }
}
