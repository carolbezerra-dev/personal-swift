//
//  TaskCellView.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import SwiftUI

struct TaskCellView: View {

    var task: Task
    @State var selected: Bool = false
    @State var completed: Bool = false

    var body: some View {
        Text(task.value)
            .font(
                .custom("IndieFlower", size: 20)
            )
            .foregroundColor(Color("crimson"))
            .onTapGesture {
                self.selected.toggle()
            }
            .listRowBackground(
                selected
                ? Color("limoncello")
                : Color(.systemGroupedBackground)
            )
            .strikethrough(completed)
            .onLongPressGesture(perform: {
                self.completed.toggle()
            })
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(task: Task(id: UUID(), value: ""))
    }
}
