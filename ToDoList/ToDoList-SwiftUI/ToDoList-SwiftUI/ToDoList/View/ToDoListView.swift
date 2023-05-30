//
//  ToDoListView.swift
//  ToDo-SwiftUI
//
//  Created by Carol Bezerra on 30/04/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDo: String = ""
    @StateObject var toDoListViewModel = ToDoListViewModel()

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

                    Text("Long press in a completed item")
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
                        toDoListViewModel.addNewTask(toDo)
                        toDo = ""
                    } label: {
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 30))
                    }
                }
                .padding([.top], 10)
                .padding([.trailing, .leading], 35)

                List {
                    ForEach(toDoListViewModel.toDoList, id: \.id) { toDo in
                        ToDoCellView(task: toDo) { task in
                            toDoListViewModel.update(toDo: task)
                        }
                    }
                    .onDelete { task in
                        toDoListViewModel.removeOne(task)
                    }
                }
                .scrollContentBackground(.hidden)
                .padding([.trailing, .leading], 15)

                Button {
                    toDoListViewModel.removeAllTasks()
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

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
