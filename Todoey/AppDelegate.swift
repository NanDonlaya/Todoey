//
//  AppDelegate.swift
//  Todoey
//
//  Created by Donlaya on 9/8/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print("Location's Realm Ignore \(Realm.Configuration.defaultConfiguration.fileURL)")
        
        do {
            try Realm()
            }
        catch {
            print("Inittialising Realm Error \(error)")
        }
        
        return true
    }



}

