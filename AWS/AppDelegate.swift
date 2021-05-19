//
//  AppDelegate.swift
//  AWS
//
//  Created by Tom on 2021/4/24.
//

import UIKit
import Amplify
import AmplifyPlugins

//https://sandbox.amplifyapp.com/schema-design/ac57ee4a-7764-4307-8623-d8c1bdaa4a37

 
@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    func initializeAmplify() {
        let models = AmplifyModels()
        let apiPlugin = AWSAPIPlugin(modelRegistration: models)
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
        do {
            try Amplify.add(plugin: apiPlugin)
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            assert(false, "Could not initialize Amplify: \(error)")
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initializeAmplify()
        
        
        
        return true
    }
 

}

