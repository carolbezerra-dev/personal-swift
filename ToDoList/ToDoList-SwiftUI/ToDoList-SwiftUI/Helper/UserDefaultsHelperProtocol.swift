//
//  UserDefaultsHelperProtocol.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 01/06/23.
//

import Foundation

protocol UserDefaultsHelperProtocol {
    func add(_ toDoList: [Task])
    func getTasks() -> [Task]
    func update(_ toDoList: [Task])
    func removeAll()
}
