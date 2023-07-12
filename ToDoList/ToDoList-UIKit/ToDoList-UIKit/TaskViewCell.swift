//
//  TaskViewCell.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 15/06/23.
//

import UIKit

class TaskViewCell: UITableViewCell {

    var task: String? {
        didSet {
            taskLabel.text = task
        }
    }

    var isTaskSelected: Bool = false

    var isTaskCompleted: Bool = false {
        didSet {

            if isTaskCompleted {
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: task ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                taskLabel.attributedText = attributeString
                taskLabel.textColor = .green
            } else {
                taskLabel.textColor = .cyan
                taskLabel.text = task
            }
        }
    }

    lazy var taskLabel: UILabel = {
        let taskLabel = UILabel()

        taskLabel.numberOfLines = 0
        taskLabel.font = UIFont.boldSystemFont(ofSize: 18)
        taskLabel.textColor = Colors().crimson
        taskLabel.translatesAutoresizingMaskIntoConstraints = false

        return taskLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(taskLabel)

        taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        taskLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
