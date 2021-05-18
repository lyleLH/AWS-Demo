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
        do {
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: AmplifyModels()))
            try Amplify.configure()
    
            // and so on ...
        } catch {
            assert(false, "Error initializing Amplify: \(error)")
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initializeAmplify()
        
        let tom:User  = User(id: "001", name: "tom", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["King Of City"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let jerry:User  = User(id: "002", name: "jerry", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["嘻嘻哈哈"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let john:User  = User(id: "003", name: "john", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["吊儿郎当"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        
        let community:Community = Community(
                name: "YeahKa",
            users:[])
        let usercmt:UserCommunity = UserCommunity(user: tom, community: community)
       
        Amplify.DataStore.save(tom) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.id)")
            case .failure(let error):
                print("Could not save item to DataStore: \(error)")
            }
        }
        Amplify.DataStore.save(jerry)
        Amplify.DataStore.save(john)
        
        Amplify.DataStore.save(community) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.id)")
            case .failure(let error):
                print("Could not save item to DataStore: \(error)")
            }
        }
        Amplify.DataStore.save(usercmt) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.id)")
            case .failure(let error):
                print("Could not save item to DataStore: \(error)")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

