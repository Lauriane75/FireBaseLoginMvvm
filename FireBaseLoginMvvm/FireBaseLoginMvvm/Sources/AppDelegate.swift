//
//  AppDelegate.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: GeneralCoordinator!
    var context: Context!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        FirebaseApp.configure()

        let client = HTTPClient()
        let firebase = Firebase()

        context = Context(client: client, firebase: firebase)

        coordinator = GeneralCoordinator(presenter: window!,
                                         context: context)
        coordinator?.start()

        return true
    }
}

