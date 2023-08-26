//
//  ViewController.swift
//  CatStoryBoard
//
//  Created by Oliver Zheng on 8/22/23.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewModel = CatServiceViewModel()
        let catListView = CatListView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: catListView)
        addChild(hostingController)
                view.addSubview(hostingController.view)

                hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                    hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])

            hostingController.didMove(toParent: self)
    }


}

