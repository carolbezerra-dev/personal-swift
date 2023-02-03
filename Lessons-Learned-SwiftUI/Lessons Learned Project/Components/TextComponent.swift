//
//  SwiftUIView.swift
//  Lessons Learned Project
//
//  Created by Carol Bezerra on 12/12/22.
//

import SwiftUI

struct TextComponent: View {

    let longText: String
    let shortText: String

    var body: some View {

        Text(longText)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding()

        Text(shortText)
            .italic()
            .frame(maxWidth: .infinity, alignment: .trailing)
        // .infinity usa o espaço horizontal todo
            .padding()
    }
}
