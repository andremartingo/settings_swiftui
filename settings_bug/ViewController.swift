//
//  ViewController.swift
//  settings
//
//  Created by Andre Martingo on 19.06.20.
//  Copyright © 2020 Andre Martingo. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

//class ChildViewController<Content>: UIHostingController<Content>  where Content : View {
//
//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.willTransition(to: newCollection, with: coordinator)
//        view.layoutIfNeeded()
//        view.invalidateIntrinsicContentSize()
//        view.setNeedsLayout()
//       //Do something
//    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        view.layoutIfNeeded()
//        view.invalidateIntrinsicContentSize()
//        view.setNeedsLayout()
//    }
//}

class ViewController: UIViewController {
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("Use init(viewModel:) instead.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Settings"

        let hostingController = UIHostingController(rootView: SettingsView(viewModel: viewModel))
        
        self.addChild(hostingController)
        
        
        hostingController.didMove(toParent: self)
        
        
        self.view.addSubview(hostingController.view)
        
        
        hostingController.view.frame = self.view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        view.layoutIfNeeded()
    }
}

