//
//  ContentView.swift
//  ToDo-SwiftUI
//
//  Created by Carol Bezerra on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var toDo: String = ""
    @State private var toDoList: [String] = []
    @State private var selectedTask: String?
    @State private var toggle: Bool = false

    var body: some View {
        NavigationView {
            VStack {

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

                HStack {
                    TextField("", text: $toDo)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(Color("darkviolet"), lineWidth: 2)
                        )

                    Button {
                        toDo == "" ? nil : toDoList.append(toDo)
                        toDo = ""
                    } label: {
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 30))
                    }
                }
                .padding([.top], 10)
                .padding([.trailing, .leading], 35)

                List {
                    ForEach(toDoList, id: \.self) { task in
//                        Button(action: {
//                            self.selectedFruit = task
//                        }, label: {
//                            Text(task)
//                                .font(
//                                    .custom("IndieFlower", size: 20)
//                                )
//                                .foregroundColor(Color("crimson"))
//                        })
//                        .listRowBackground(self.selectedFruit == task
//                                           ? Color("limoncello")
//                                           : Color(.systemGroupedBackground)
//                        )
                        Text(task)
                            .font(
                                .custom("IndieFlower", size: 20)
                            )
                            .foregroundColor(Color("crimson"))
                            .onTapGesture {
                                self.selectedTask = task
                            }
                            .listRowBackground(self.selectedTask == task
                                               ? Color("limoncello")
                                               : Color(.systemGroupedBackground)
                            )
                            .strikethrough(toggle)
                            .onLongPressGesture(perform: {
                                self.toggle = !toggle
                            })
                    }
                    .onDelete { item in
                        toDoList.remove(atOffsets: item)
                    }
                }
                .scrollContentBackground(.hidden)
                .padding([.trailing, .leading], 15)

                Button {
                    toDoList.removeAll()
                } label: {
                    HStack {
                        Text("Yeah, it is done!")
                            .tint(.pink)
                            .fontWeight(.semibold)
                        Image(systemName: "flame.fill")
                            .font(.system(size: 20))
                            .tint(.pink)
                    }
                    .padding(5)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(.pink)
                    )
                }
            }.background(
                Image("ToDoList")
                    .resizable()
                    .ignoresSafeArea()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
