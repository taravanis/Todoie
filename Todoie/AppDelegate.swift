//
//  AppDelegate.swift
//  Todoie
//
//  Created by Theophilos Aravanis on 12/23/17.
//  Copyright © 2017 Theophilos Aravanis. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)

        do {
            _ = try Realm()
        }
        catch {
          print("Error installing new realm, \(error)")
        }
        return true
    }
}

