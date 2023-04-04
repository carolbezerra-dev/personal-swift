//
//  ViewController.swift
//  Lessons-Learned-UIKit
//
//  Created by Carol Bezerra on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    let screen = ViewControllerView()

    override func loadView() { // carrega a interface
        // no Storyboard isso acontece embaixo do pano, ViewCode tem que explicitar
        self.view = screen

    }

/// TENTATIVA DE MUDAR COR DA NAVBAR
///    override func viewWillAppear(_ animated: Bool) {
///        super.viewWillAppear(animated)
///        navigationController?.navigationBar.barTintColor = .green
///    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        UINavigationBar.appearance().backgroundColor = .green

        
/// TENTATIVA DE MUDAR COR DA NAVBAR
///       let appearance = UINavigationBarAppearance()
///        appearance.configureWithOpaqueBackground()
///        appearance.backgroundColor = UIColor.green
    }
}

