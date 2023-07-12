//
//  ViewControllerScreen.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 10/07/23.
//

import UIKit

final class ViewControllerScreen: UIView {

    lazy var textField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRectMake(8, 8, 8, textField.frame.height))

        textField.isUserInteractionEnabled = true

        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = Colors().purple?.cgColor
        textField.leftView = paddingView
        textField.leftViewMode = .always

        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    lazy var addButton: UIButton = {
        let addButton = UIButton()
        let styleConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let icon = UIImage(systemName: Icons().plusButton, withConfiguration: styleConfig)

        addButton.setImage(icon, for: .normal)

        addButton.translatesAutoresizingMaskIntoConstraints = false

        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)

        return addButton
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.backgroundColor = .clear
        tableView.register(TaskViewCell.self, forCellReuseIdentifier: Identifier().forCellReuse)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    lazy var deleteAllButton: UIButton = {
        let deleteAllButton = UIButton()
        let styleConfig = UIImage.SymbolConfiguration(textStyle: .title2)
        let icon = UIImage(systemName: Icons().flameButton, withConfiguration: styleConfig)

        deleteAllButton.setTitle(" Yeah, it is done! ", for: .normal)
        deleteAllButton.setImage(icon, for: .normal)

        deleteAllButton.semanticContentAttribute = .forceRightToLeft
        deleteAllButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        deleteAllButton.tintColor = .white
        deleteAllButton.backgroundColor = .systemPink
        deleteAllButton.layer.cornerRadius = 10

        deleteAllButton.translatesAutoresizingMaskIntoConstraints = false

        deleteAllButton.addTarget(self, action: #selector(remove), for: .touchUpInside)

        return deleteAllButton
    }()

    var addNew: (() -> Void)?
    var removeAll: (() -> Void)?
    
    @objc func add() {
        addNew?()
    }

    @objc func remove() {
        removeAll?()
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(textField)
        addSubview(addButton)
        addSubview(tableView)
        addSubview(deleteAllButton)

        textField.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        addButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: deleteAllButton.topAnchor, constant: -10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true

        deleteAllButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        deleteAllButton.widthAnchor.constraint(equalToConstant: 168).isActive = true
        deleteAllButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        deleteAllButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
