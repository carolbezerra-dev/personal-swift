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

//    private func setupLongGestureRecognizerOnCollection() {
//        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
//        lpgr.minimumPressDuration = 0.5
//        lpgr.delaysTouchesBegan = true
////        lpgr.delegate = self
//        screen.tableView.addGestureRecognizer(lpgr)
//    }
//
//    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
//        guard gestureReconizer.state != .began else { return }
//        let point = gestureReconizer.location(in: screen.tableView)
//        let indexPath = screen.tableView.indexPathForItem(at: point)
//        if let index = indexPath {
//            print(index.row)
//        } else {
//            print("Could not find index path")
//        }
//    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier().forCellReuse, for: indexPath) as! TaskViewCell

        cell.taskLabel.text = tasks[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TaskViewCell
        cell.isTaskSelected.toggle()

        if cell.isTaskSelected {
            cell.backgroundColor = Colors().yellow
        } else {
            cell.backgroundColor = .clear
        }
    }

}
