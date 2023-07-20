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
    var tasks = [Task]()

    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen.tableView.dataSource = self
        screen.tableView.delegate = self
        screen.tableView.allowsMultipleSelection = true

        screen.addNew = addNewTask
        screen.removeAll = removeAllTasks

        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        screen.tableView.addGestureRecognizer(longPress)
    }

    func addNewTask() {
        let text = screen.textField.text

        viewModel.addTask(toDo: text ?? "")
        screen.textField.text = ""

        let indexPath = IndexPath(row: (tasks.count), section: 0)
        tasks = viewModel.getTasks()
        screen.tableView.insertRows(at: [indexPath], with: .automatic)
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
                let task = tasks[indexPath.row]

                task.isTaskCompleted.toggle()

                if task.isTaskCompleted {
                    let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: task.taskName)
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                    cell.taskLabel.attributedText = attributeString
//                    cell.taskLabel.textColor = .green
                } else {
//                    cell.taskLabel.textColor = .cyan
                    cell.taskLabel.text = task.taskName
                }
                
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

        cell.taskLabel.text = tasks[indexPath.row].taskName
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TaskViewCell
        let task = tasks[indexPath.row]

        task.isTaskSelected.toggle()

        if task.isTaskSelected {
            cell.backgroundColor = Colors().yellow
        } else {
            cell.backgroundColor = .clear
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeOne(indexPath.row)
            tasks = viewModel.getTasks()
            screen.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
