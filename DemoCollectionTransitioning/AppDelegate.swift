//
//  AppDelegate.swift
//  DemoCollectionTransitioning
//
//  Created by DREAMWORLD on 19/11/24.
//

import UIKit
import Hero

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "CollectionListVC") as! CollectionListVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.hero.isEnabled = true
        window?.rootViewController = navigationController
        return true
    }
}

