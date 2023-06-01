//
//  UserDefaultsHelper.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import Foundation

struct UserDefaultsHelper: UserDefaultsHelperProtocol {

    private var userDefaults: UserDefaults = UserDefaults.standard

    func add(_ toDoList: [Task]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode toDoList
            let data = try encoder.encode(toDoList)

            // Write/Set Data
            userDefaults.set(data, forKey: "SavedList")

        } catch {
            print("Unable to Encode ToDoList (\(error))")
        }
    }

    func getTasks() -> [Task] {
        if let list = userDefaults.data(forKey: "SavedList") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode toDoList
                let toDoList = try decoder.decode([Task].self, from: list)

                return toDoList
            } catch {
                print("Unable to Decode ToDoList (\(error))")
            }
        }
        return []
    }

    func update(_ toDoList: [Task]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(toDoList)

            // Write/Set Data
            userDefaults.set(data, forKey: "SavedList")
            userDefaults.synchronize()

        } catch {
            print("Unable to Encode ToDoList (\(error))")
        }
    }

    func removeAll() {
        userDefaults.removeObject(forKey: "SavedList")
    }
}
