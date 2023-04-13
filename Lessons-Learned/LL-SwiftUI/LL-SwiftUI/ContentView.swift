//
//  ContentView.swift
//  Lessons Learned Project
//
//  Created by Carol Bezerra on 06/12/22.
//

import SwiftUI

struct ContentView: View {

    let barTitle = "Lessons Learned"

    var body: some View {
        NavigationView { // sem isso, o título some
            ZStack {
                Color(red: 253.0, green: 251.0, blue: 251.0)
                    .ignoresSafeArea() // background da tela como um todo

                VStack {
                    Rectangle() // define toda NavBar
                        .frame(height: 0) // para não pegar o espaço todo
                        .background(Color.green)

                    ScrollView { // body da tela

                        ImageComponent(
                            image: "carol-tw-2022",
                            name: "Carol Bezerra",
                            link: "https://www.linkedin.com/in/carolbezerra-dev/?locale=en_US"
                        )

                        ItemComponent(
                            learned: [
                                "UIKit",
                                "SwiftUI",
                                "VoiceOver",
                                "Tests",
                                "TDD"
                            ],
                            toLearn: [
                                "Manipulate the header",
                                "Create a single app",
                                "SwiftUI and UIKit",
                                "Reproduze old projects",
                                "More of tests"
                            ]
                        )

                        TextComponent(
                            longText: "This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen.",
                            shortText: "Short text just for testing"
                        )
                    }

                    Spacer() // define o espaço para que a NavBar exista
                }
                .navigationBarTitle(barTitle, displayMode: .inline)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
