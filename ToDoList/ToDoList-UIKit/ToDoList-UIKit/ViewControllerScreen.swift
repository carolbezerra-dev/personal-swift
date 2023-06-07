//
//  ViewControllerScreen.swift
//  ToDoList-UIKit
//
//  Created by Carol Bezerra on 07/06/23.
//

import UIKit

final class ViewControllerScreen: UIView {

    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundImage.image = UIImage(named: "ToDoList")

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false

        return backgroundImage
    }()

//    lazy var title: UILabel = {
//        let title = UILabel()
//
//        title.text = "My To Do List"
//        title.font = UIFont(name: "DancingScript-Bold", size: 30)
//
//        return title
//    }()
//
//    lazy var subtitle: UILabel = {
//        let subtitle = UILabel()
//
//        subtitle.text = "Long press in a completed item"
//        subtitle.textColor = UIColor(named: "darksalmon")
//
//        return subtitle
//    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

//        let backgroundImage = UIImage(named: "ToDoList")
//
//        backgroundColor = UIColor(patternImage: backgroundImage!)

        addSubview(backgroundImage)

        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

//        addSubview(title)
//
//        title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
