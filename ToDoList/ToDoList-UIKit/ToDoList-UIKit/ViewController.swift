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
    var tasks = [String]()

    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen.tableView.dataSource = self
        screen.tableView.delegate = self

        screen.addNew = addNewTask
        screen.removeAll = removeAllTasks
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
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TaskViewCell

        cell.taskLabel.text = tasks[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
