//
//  AppDelegate.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    var navigationController: UINavigationController {
        let viewModel = ListViewModel<Gallery>(items: [], service: GalleryService())
        let viewController = CollectionViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

