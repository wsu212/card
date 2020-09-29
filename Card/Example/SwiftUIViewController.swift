//
//  SwiftUIViewController.swift
//  Card
//
//  Created by Wei-Lun Su on 9/28/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {
    let uiHostingController = UIHostingController(rootView: ContentView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(uiHostingController)
        view.addSubview(uiHostingController.view)
        uiHostingController.view.pinEdges(to: view)
    }
}
