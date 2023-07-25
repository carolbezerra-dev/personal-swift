//
//  CharactersMarvel_SwiftUIApp.swift
//  CharactersMarvel-SwiftUI
//
//  Created by Carol Bezerra on 24/07/23.
//

import SwiftUI

@main
struct CharactersMarvel_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
