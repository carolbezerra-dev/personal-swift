//
//  ItemComponent.swift
//  Lessons Learned Project
//
//  Created by Carol Bezerra on 12/12/22.
//

import SwiftUI

struct LessonsLearned: View {

    let items: [String]

    var body: some View {
        Text(items[0])
            .font(
                .system(
                    size: 18,
                    weight: .light,
                    design: .rounded
                )
            )
        Text(items[1])
            .font(
                .system(
                    size: 18,
                    weight: .heavy,
                    design: .monospaced
                )
            )
        Text(items[2])
            .font(
                .custom(
                    "AmericanTypewriter",
                    fixedSize: 18
                )
                .weight(.medium)
            )
        Text(items[3])
            .font(
                .body
                    .weight(.semibold)
            )
            .foregroundColor(.indigo)
        Text(items[4]).fontWeight(.ultraLight)
    }
}

struct WantToLearn: View {

    let items: [String]

    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding([.leading, .top])
            }
        }
    }
}

struct ItemComponent: View {

    let learned: [String]
    let toLearn: [String]

    var body: some View {

        Text("Lessons Learned")
            .bold()
            .padding(.top)
        LessonsLearned(items: learned)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding([.leading, .top])

        Text("I want to learn")
            .italic()
            .padding(.top)
        WantToLearn(items: toLearn)
    }
}
