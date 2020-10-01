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
    
    private let tabBarController: UITabBarController = {
        let viewModel = ListViewModel<Gallery>(items: [], service: GalleryService())
        let uikitViewController = CollectionViewController(viewModel: viewModel)
        let swiftUIViewController = SwiftUIViewController()
        
        uikitViewController.title = "UIKit"
        swiftUIViewController.title = "SwiftUI"
        
        let controller = UITabBarController()
            controller.viewControllers = [uikitViewController,
                                          swiftUIViewController
            ].map(UINavigationController.init(rootViewController:))
        
        uikitViewController.tabBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "applelogo"), tag: 0)
        swiftUIViewController.tabBarItem = UITabBarItem(title: "SwiftUI", image: UIImage(systemName: "swift"), tag: 1)
        
        return controller
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

