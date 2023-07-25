//
//  MainView.swift
//  CharactersMarvel-SwiftUI
//
//  Created by Carol Bezerra on 24/07/23.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            HStack {
                CardView(card: Card(photo: Image(systemName: "person.text.rectangle.fill"), name: Text("Marvel Character Marvel Character Marvel Character")))
                CardView(card: Card(photo: Image(systemName: "person.text.rectangle"), name: Text("Marvel Character Marvel Character Marvel Character")))
            }
            //            VStack {
            //                CardView(card: Card.example)
            //                CardView(card: Card.example)
            //            }
        }
    }

    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
