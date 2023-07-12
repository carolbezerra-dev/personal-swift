//
//  ViewController.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 07/06/23.
//

import UIKit

class ViewController: UIViewController {

    let screen = ViewControllerScreen()
    let viewModel = ViewModel()
//    var tasks = [String]()
    var tasks = ["teste1", "teste2", "teste3", "teste4", "teste5"]

    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen.tableView.dataSource = self
        screen.tableView.delegate = self

        screen.addNew = addNewTask
        screen.removeAll = removeAllTasks

        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        screen.tableView.addGestureRecognizer(longPress)
    }

    func addNewTask() {
        let text = screen.textField.text
        viewModel.addTask(toDo: text ?? "")
        screen.textField.text = ""

        tasks = viewModel.getTasks()
        screen.tableView.reloadData()
    }

    func removeAllTasks() {
        tasks = viewModel.removeTasks()
        screen.tableView.reloadData()
    }

    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: screen.tableView)
            if let indexPath = screen.tableView.indexPathForRow(at: touchPoint) {
                let cell = screen.tableView.dequeueReusableCell(withIdentifier: Identifier().forCellReuse, for: indexPath) as! TaskViewCell

                cell.isTaskCompleted.toggle()
                screen.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier().forCellReuse, for: indexPath) as! TaskViewCell

        cell.taskLabel.text = tasks[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let cell = tableView.cellForRow(at: indexPath) as! TaskViewCell
        cell.isTaskSelected.toggle()

        if cell.isTaskSelected {
            cell.backgroundColor = Colors().yellow
        } else {
            cell.backgroundColor = .white
        }
    }

}
