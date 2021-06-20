//
//  AppDelegate.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = SprintRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let window = application.windows.first ?? UIWindow(frame: UIScreen.main.bounds)
        
        router.present(on: window)
        
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }

}
