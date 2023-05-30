//
//  ToDoCellView.swift
//  ToDoList-SwiftUI
//
//  Created by Carol Bezerra on 24/05/23.
//

import SwiftUI

struct ToDoCellView: View {

    @State var task: Task
    var action: ((Task) -> Void)?
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
            .strikethrough(task.completed)
            .onLongPressGesture(perform: {
                longPressPerform()
            })
    }

    private func longPressPerform() {
        task.completed.toggle()
        action?(task)
        self.completed.toggle()
    }
}

struct ToDoCellView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCellView(task: Task(id: UUID(), value: "", completed: false))
    }
}
