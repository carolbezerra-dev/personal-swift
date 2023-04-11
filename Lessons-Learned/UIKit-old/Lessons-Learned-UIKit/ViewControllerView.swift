//
//  ViewControllerScreen.swift
//  Lessons-Learned-UIKit
//
//  Created by Carol Bezerra on 07/02/23.
//

import UIKit

/* ORDEM PARA APARECER NA TELA
1 - criar o item
2 - cancelar qualquer constraint padrão
3 - adicionar item a subview (o item precisa ser do tipo View)
4 - criar novas contraints
*/

final class ViewControllerView: UIView {

// MARK: - Declarar objetos como variável computada, só carrega quando chamada

    lazy var masterScrollView: UIScrollView = {
        let masterScrollView = UIScrollView()

        masterScrollView.translatesAutoresizingMaskIntoConstraints = false

        return masterScrollView
    }()

    lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()

        mainStackView.axis = .vertical
        mainStackView.spacing = 20

        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        return mainStackView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "carol-tw-2022")

        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.cyan.cgColor

//        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var link: UILabel = {
        let link = UILabel()

        link.textColor = .blue
        link.text = "Carol Bezerra"
        link.textAlignment = .center
        link.font = .boldSystemFont(ofSize: 19.0)
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
        lessonsList.font = .boldSystemFont(ofSize: 19)

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

        longText.text = "Esse texto é muito longo e, inicialmente, não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialemente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela. Esse texto é muito longo e, inicialmente, ele não seria exibido inteiro. Mas vamos colocar nil para limite de linhas, assim será possível visualizar o texto inteiro na tela."

        longText.translatesAutoresizingMaskIntoConstraints = false

        return longText
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

// MARK: - NavBar
        /// TENTATIVA DE MUDAR COR DA NAVBAR
        ///        let navBar = UINavigationBar.appearance()
        ///        navBar.backgroundColor = .green
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }

    func addItemsOnScreenAndSetConstraints() {

        for item in toLearn {
            let learn = UILabel()
            learn.text = item

            toLearnStackView.addArrangedSubview(learn)
            // adiciona cada item na StackView
        }

        // MARK: - Master Scroll View

        addSubview(masterScrollView)
        masterScrollView.addSubview(mainStackView)

        masterScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        masterScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        masterScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        masterScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        // MARK: - Main Stack View

        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(link)
        mainStackView.addArrangedSubview(lessonsList)
        mainStackView.addArrangedSubview(itemsStackView)
        mainStackView.addArrangedSubview(wantToLearn)
        mainStackView.addArrangedSubview(toLearnStackView)
        mainStackView.addArrangedSubview(longText)


        mainStackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

//        // MARK: - Image
//
//        addSubview(imageView)
//
//        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//
//        // MARK: - Link
//
//        addSubview(link)
//
//        link.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
//        link.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        link.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140).isActive = true
//
//        // MARK: - Lessons List Title
//
//        addSubview(lessonsList)
//
//        lessonsList.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 30).isActive = true
//        lessonsList.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//
//        // MARK: - Lessons List Items
//
//        addSubview(itemsStackView)
//
//        itemsStackView.topAnchor.constraint(equalTo: lessonsList.bottomAnchor, constant: 20).isActive = true
//        itemsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        itemsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//
//
//        // MARK: - I want to learn Title
//
//        addSubview(wantToLearn)
//
//        wantToLearn.topAnchor.constraint(equalTo: itemsStackView.bottomAnchor, constant: 30).isActive = true
//        wantToLearn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // MARK: - I want to learn Items


//        addSubview(toLearnStackView)
//        // adicionar a StackView na View como um todo
//
//        toLearnStackView.topAnchor.constraint(equalTo: wantToLearn.bottomAnchor, constant: 20).isActive = true
//        toLearnStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        toLearnStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true

        // MARK: - Long text

//        addSubview(longText)
//
//        longText.topAnchor.constraint(equalTo: toLearnStackView.bottomAnchor, constant: 20).isActive = true
//        longText.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor).isActive = true
//        longText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        longText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true

        // MARK: - Short text


        /// PARA O PAREAMENTO
        /// como colocar Scroll?
        /// posicionar o texto
    }


    @objc func clickLink() {
        if let url = URL(string: "https://www.linkedin.com/in/carolbezerra-dev/") {
            UIApplication.shared.open(url)
        }
    }
}
