//
//  ViewControllerScreen.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 07/06/23.
//

import UIKit

final class ViewControllerScreen: UIView {

    lazy var mainView: UIView = {
        let mainView = UIView()

        mainView.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false

        return mainView
    }()

    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundImage.image = UIImage(named: "ToDoList")

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false

        return backgroundImage
    }()

    lazy var title: UILabel = {
        let title = UILabel()

        title.text = "My To Do List"
        title.textAlignment = .center
        title.font = UIFont(name: "DancingScript-Bold", size: 30)

        title.translatesAutoresizingMaskIntoConstraints = false

        return title
    }()

    lazy var subtitle: UILabel = {
        let subtitle = UILabel()

        subtitle.text = "Long press in a completed item"
        subtitle.textColor = UIColor(named: "darksalmon")
        subtitle.font = UIFont(name: "DancingScript-Regular", size: 16)

        subtitle.translatesAutoresizingMaskIntoConstraints = false

        return subtitle
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRectMake(8, 8, 8, textField.frame.height))

        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor(named: "darkviolet")?.cgColor
        textField.leftView = paddingView
        textField.leftViewMode = .always

        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    lazy var addButton: UIButton = {
        let addButton = UIButton()
        let styleConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let icon = UIImage(systemName: "plus.rectangle.fill", withConfiguration: styleConfig)

        addButton.setImage(icon, for: .normal)

        addButton.translatesAutoresizingMaskIntoConstraints = false

        return addButton
    }()

    lazy var textStackView: UIStackView = {
        let textStackView = UIStackView(arrangedSubviews: [textField, addButton])

        textStackView.axis = .horizontal
        textStackView.spacing = 8

        textStackView.translatesAutoresizingMaskIntoConstraints = false

        return textStackView
    }()

    lazy var deleteAllButton: UIButton = {
        let deleteAllButton = UIButton()
        let styleConfig = UIImage.SymbolConfiguration(textStyle: .title2)
        let icon = UIImage(systemName: "flame.fill", withConfiguration: styleConfig)

        deleteAllButton.setTitle("Yeah, it is done! ", for: .normal)
        deleteAllButton.setImage(icon, for: .normal)

        deleteAllButton.semanticContentAttribute = .forceRightToLeft
        deleteAllButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        deleteAllButton.tintColor = .white
        deleteAllButton.backgroundColor = .systemPink
        deleteAllButton.layer.cornerRadius = 10

        deleteAllButton.translatesAutoresizingMaskIntoConstraints = false

        return deleteAllButton
    }()

    let tasks = [
        "push code",
        "read article",
        "study about the company",
        "check vacancy"
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        // MARK: - Content

        addSubview(mainView)

        mainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        // MARK: - Background Image

        mainView.addSubview(backgroundImage)

        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true

        // MARK: - Title

        backgroundImage.addSubview(title)

        title.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 110).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // MARK: - Subtitle

        backgroundImage.addSubview(subtitle)

        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        subtitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // MARK: - Text StackView

        backgroundImage.addSubview(textStackView)

        textStackView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 25).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 35).isActive = true
        textStackView.heightAnchor.constraint(equalToConstant: 43).isActive = true
        textStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // MARK: - List

        // MARK: - Delete All Button

        backgroundImage.addSubview(deleteAllButton)

        deleteAllButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        deleteAllButton.widthAnchor.constraint(equalToConstant: 168).isActive = true
        deleteAllButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        deleteAllButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
