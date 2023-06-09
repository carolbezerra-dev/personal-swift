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
//        title.font = UIFont(name: "DancingScript-Bold", size: 30)
        title.textColor = .red
        title.textAlignment = .center

        return title
    }()

    lazy var subtitle: UILabel = {
        let subtitle = UILabel()

        subtitle.text = "Long press in a completed item"
        subtitle.textColor = UIColor(named: "darksalmon")

        return subtitle
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

        title.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 50).isActive = true
        title.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor).isActive = true
        title.widthAnchor.constraint(equalToConstant: 150).isActive = true
        title.heightAnchor.constraint(equalToConstant: 150).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // MARK: - Subtitle


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
