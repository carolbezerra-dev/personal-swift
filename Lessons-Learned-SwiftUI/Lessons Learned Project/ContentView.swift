//
//  ContentView.swift
//  Lessons Learned Project
//
//  Created by Carol Bezerra on 06/12/22.
//

import SwiftUI

struct ContentView: View {

    let barTitle = "Lições Aprendidas"

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
                            link: "https://www.linkedin.com/in/carolbezerra-dev/"
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
                                "Create a single page",
                                "SwiftUI and UIKit",
                                "Reproduze old projects",
                                "More of tests"
                            ]
                        )

                        TextComponent(
                            longText: "Esse texto é muito longo e, inicialmente, não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialemente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela.",
                            shortText: "Texto pequeno só para testar"
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
