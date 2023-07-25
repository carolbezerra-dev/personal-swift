//
//  Card.swift
//  CharactersMarvel-SwiftUI
//
//  Created by Carol Bezerra on 25/07/23.
//

import SwiftUI

struct CardView: View {
    @State var card: Card

    var body: some View {
        ZStack {
            VStack {
                card.photo
                    .resizable()
                    .frame(width: 150, height: 100)
                    .padding()

                HStack(alignment: .bottom, spacing: 15) {
                    card.name

                    Button {
                        toggleFavorite()
                    } label: {
                        card.isFavorite
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .padding(.all, 2)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1)
        )
    }

    private func toggleFavorite() {
        card.favorite.toggle()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(
            photo: Image(systemName: "person.text.rectangle.fill"),
            name: Text("Marvel Character Marvel Character Marvel Character")
        ))
    }
}
