//
//  ContentView.swift
//  ToDo-SwiftUI
//
//  Created by Carol Bezerra on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {

                    TextField("", text: $username)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(Color("darkviolet"), lineWidth: 2)
                        )

                    Button(role: nil) {
                        print("pressed")
                    } label: {
                        Image(systemName: "plus.rectangle.fill").font(.system(size: 30))
                    }
                }
                .padding([.top, .bottom], 50)
                .padding([.trailing, .leading], 10)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .principal) {
                    VStack {

                        Text(" ")
                        Divider()
                            .frame(width: 200, height: 4)
                            .overlay(Color("darksalmon"))

                        Text("My To Do List")
                            .font(
                                .custom("DancingScript-Bold", size: 30, relativeTo: .headline)
                            )

                        Text("Double-tap in a completed item")
                            .font(
                                .custom("DancingScript-Regular", size: 20, relativeTo: .subheadline)
                            )
                            .foregroundColor(Color("darksalmon"))
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
