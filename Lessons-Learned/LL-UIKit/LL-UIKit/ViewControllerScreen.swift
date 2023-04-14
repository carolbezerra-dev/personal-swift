//
//  ViewControllerScreen.swift
//  LL-UIKit
//
//  Created by Carol Bezerra on 07/02/23.
//

import UIKit

final class ViewControllerScreen: UIView {

    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()

        scroll.translatesAutoresizingMaskIntoConstraints = false

        return scroll
    }()

    lazy var content: UIView = {
        let content = UIView()

        content.translatesAutoresizingMaskIntoConstraints = false

        return content
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "carol-tw-2022")

        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.cyan.cgColor

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var link: UILabel = {
        let link = UILabel()

        link.textColor = .blue
        link.text = "Carol Bezerra"
        link.textAlignment = .center
        link.font = .boldSystemFont(ofSize: 17.0)
        link.isUserInteractionEnabled = true

        link.translatesAutoresizingMaskIntoConstraints = false

        let tap = UITapGestureRecognizer(target: self, action: #selector(clickLink))
        link.addGestureRecognizer(tap)

        return link
    }()

    lazy var lessonsList: UILabel = {
        let lessonsList = UILabel()

        lessonsList.text = "Lições Aprendidas"
        lessonsList.textAlignment = .center
        lessonsList.font = .boldSystemFont(ofSize: 18)

        lessonsList.translatesAutoresizingMaskIntoConstraints = false

        return lessonsList
    }()

    lazy var item1: UILabel = {
        let item1 = UILabel()

        item1.text = "UIKit"
        item1.textAlignment = .center
        item1.font = .systemFont(ofSize: 18.0, weight: .light)

        return item1
    }()

    lazy var item2: UILabel = {
        let item2 = UILabel()

        item2.text = "SwiftUI"
        item2.textAlignment = .center
        item2.font = .monospacedSystemFont(ofSize: 18.0, weight: .heavy)

        return item2
    }()

    lazy var item3: UILabel = {
        let item3 = UILabel()

        item3.text = "VoiceOver"
        item3.textAlignment = .center
        item3.font = UIFont(name: "AmericanTypewriter", size: 18.0)

        return item3
    }()

    lazy var item4: UILabel = {
        let item4 = UILabel()

        item4.text = "Tests"
        item4.textAlignment = .center
        item4.font = .systemFont(ofSize: 18.0, weight: .semibold)
        item4.textColor = .systemCyan

        return item4
    }()

    lazy var item5: UILabel = {
        let item5 = UILabel()

        item5.text = "TDD"
        item5.textAlignment = .center
        item5.font = .systemFont(ofSize: 18.0, weight: .ultraLight)

        return item5
    }()

    lazy var itemsStackView: UIStackView = {
        let itemsStackView = UIStackView(arrangedSubviews: [item1, item2, item3, item4, item5])

        itemsStackView.axis = .vertical
        itemsStackView.spacing = 20
        itemsStackView.alignment = .leading

        itemsStackView.translatesAutoresizingMaskIntoConstraints = false

        return itemsStackView
    }()

    lazy var wantToLearn: UILabel = {
        let wantToLearn = UILabel()

        wantToLearn.text = "I want to learn"
        wantToLearn.textAlignment = .center
        wantToLearn.font = .italicSystemFont(ofSize: 19)

        wantToLearn.translatesAutoresizingMaskIntoConstraints = false

        return wantToLearn
    }()

    lazy var toLearnStackView: UIStackView = {
        let itemsStackView = UIStackView()

        itemsStackView.axis = .vertical
        itemsStackView.spacing = 20
        itemsStackView.alignment = .leading

        itemsStackView.translatesAutoresizingMaskIntoConstraints = false


        return itemsStackView
    }()

    lazy var longText: UILabel = {
        let longText = UILabel()

        longText.text = "This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen. This text is too long and initially would not display in full. But let's put nil for the line limit, so it will be possible to view the entire text on the screen."
        longText.numberOfLines = 0

        longText.translatesAutoresizingMaskIntoConstraints = false

        return longText
    }()

    lazy var shortText: UILabel = {
        let shortText = UILabel()

        shortText.text = "Short text just for testing"
        shortText.font = .italicSystemFont(ofSize: 17.0)

        shortText.translatesAutoresizingMaskIntoConstraints = false

        return shortText
    }()

    let toLearn = [
        "Manipulate the header",
        "Create a single app",
        "SwiftUI and UIKit",
        "Reproduze old projects",
        "More of tests"
    ]

    override init(frame: CGRect = .zero) {

        super.init(frame: frame)
        backgroundColor = UIColor(red: 253, green: 251, blue: 251, alpha: 1)

        addItemsOnScreenAndSetConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addItemsOnScreenAndSetConstraints() {

        for item in toLearn {
            let learn = UILabel()
            learn.text = item

            toLearnStackView.addArrangedSubview(learn)
            // adiciona cada item na StackView
        }

        // MARK: - Scroll

        addSubview(scroll)

        scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scroll.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        // MARK: - Content

        scroll.addSubview(content)

        content.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor).isActive = true
        content.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true

        // MARK: - Image

        content.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: content.topAnchor, constant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: content.centerXAnchor).isActive = true

        // MARK: - Link

        content.addSubview(link)

        link.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        link.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 140).isActive = true
        link.centerXAnchor.constraint(equalTo: content.centerXAnchor).isActive = true

        // MARK: - Lessons List Title

        content.addSubview(lessonsList)

        lessonsList.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 30).isActive = true
        lessonsList.centerXAnchor.constraint(equalTo: content.centerXAnchor).isActive = true

        // MARK: - Lessons List Items

        content.addSubview(itemsStackView)

        itemsStackView.topAnchor.constraint(equalTo: lessonsList.bottomAnchor, constant: 20).isActive = true
        itemsStackView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20).isActive = true
        itemsStackView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20).isActive = true

        // MARK: - I want to learn Title

        content.addSubview(wantToLearn)

        wantToLearn.topAnchor.constraint(equalTo: itemsStackView.bottomAnchor, constant: 30).isActive = true
        wantToLearn.centerXAnchor.constraint(equalTo: content.centerXAnchor).isActive = true

        // MARK: - I want to learn Items

        content.addSubview(toLearnStackView) // adiciona a StackView na View como um todo

        toLearnStackView.topAnchor.constraint(equalTo: wantToLearn.bottomAnchor, constant: 20).isActive = true
        toLearnStackView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20).isActive = true
        toLearnStackView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20).isActive = true

        // MARK: - Long text

        content.addSubview(longText)

        longText.topAnchor.constraint(equalTo: toLearnStackView.bottomAnchor, constant: 20).isActive = true
        longText.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20).isActive = true
        longText.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20).isActive = true

        // MARK: - Short text

        content.addSubview(shortText)

        shortText.topAnchor.constraint(equalTo: longText.bottomAnchor, constant: 20).isActive = true
        shortText.bottomAnchor.constraint(greaterThanOrEqualTo: content.bottomAnchor, constant: -20).isActive = true
        shortText.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20).isActive = true
    }

    @objc func clickLink() {
        if let url = URL(string: "https://www.linkedin.com/in/carolbezerra-dev/") {
            UIApplication.shared.open(url)
        }
    }

}
