//
//  ImageComponent.swift
//  Lessons Learned Project
//
//  Created by Carol Bezerra on 12/12/22.
//

import SwiftUI

struct ImageComponent: View {

    let image: String
    let name: String
    let link: String

    var body: some View {

        Image(image)
            .resizable()
            .scaledToFit()
            .frame(
                width: 120,
                height: 150,
                alignment: .center
            )
            .clipShape(Circle()) // imagem redonda
            .overlay(
                Circle()
                    .stroke(.mint, lineWidth: 4)
            ) // sobrepondo borda
            .shadow(radius: 7)

        Link(name, destination: URL(string: link)!).font(.headline)
        // leva para link externo
    }
}
