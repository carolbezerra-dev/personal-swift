//
//  ViewController.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 07/06/23.
//

import UIKit

class ViewController: UIViewController {

    let screen = ViewControllerScreen()
    var tasks = [
        "push code",
        "read article",
        "study about the company",
        "check vacancy"
    ]

    override func loadView() {
        self.view = screen

        screen.tableView.dataSource = self
        screen.tableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = screen.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TaskViewCell

        cell.task = tasks[indexPath.row]
//        cell.taskLabel.text = tasks[indexPath.row]

        return cell
    }
}
