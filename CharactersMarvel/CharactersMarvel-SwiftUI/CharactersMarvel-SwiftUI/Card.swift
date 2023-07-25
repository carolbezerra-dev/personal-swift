//
//  Card.swift
//  CharactersMarvel-SwiftUI
//
//  Created by Carol Bezerra on 25/07/23.
//

import Foundation
import SwiftUI

struct Card {
    var favorite: Bool = false
    lazy var isFavorite = {
        favorite
        ? Image(systemName: "star.fill")
        : Image(systemName: "star")
    }()
    let photo: Image
    let name: Text

//    static let example = Card(
//        photo: Image(systemName: "person.text.rectangle.fill"),
//        name: Text("Marvel Character Marvel Character Marvel Character")
//    )
}
