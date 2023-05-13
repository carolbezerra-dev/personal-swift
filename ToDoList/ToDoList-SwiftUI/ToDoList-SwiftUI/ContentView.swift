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

                    Button {
                        print("pressed")
                    } label: {
                        Image(systemName: "plus.rectangle.fill").font(.system(size: 30))
                    }
                }
                .padding([.top], 50)
                .padding([.bottom], 25)
                .padding([.trailing, .leading], 10)

                List {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
                .listStyle(.automatic)

                Button {
                    print("delete all")
                } label: {
                    HStack {
                        Text("Yeah, it is done!")
                            .tint(.pink)
                            .fontWeight(.semibold)
                        Image(systemName: "flame")
                            .font(.system(size: 20))
                            .tint(.pink)
                    }
                    .padding(5)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(.pink)
                    )
                }
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
                                .custom("DancingScript-Regular", size: 16, relativeTo: .subheadline)
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
