//
//  DataService.swift
//  AWS
//
//  Created by Tom.Liu on 2021/5/19.
//

import Foundation
import Amplify
import AmplifyPlugins
struct DataService {
    
    func saveRandomUserData()  {
        
        let stringId = RandomString.sharedInstance.getRandomStringOfLength(length: 6)
        
        let user:User  = User(id:stringId , name: RandomString.sharedInstance.getRandomStringOfLength(length:3), catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["King Of City"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        Amplify.DataStore.save(user) { result in
            switch(result) {
            case .success(let savedItem):
                print("Saved item: \(savedItem.id)")
            case .failure(let error):
                print("Could not save item to DataStore: \(error)")
            }
        }
    }
    
 
    
    func saveUserData() {
        let tom:User  = User(id: "001", name: "tom", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["King Of City"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let jerry:User  = User(id: "002", name: "jerry", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["嘻嘻哈哈"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let john:User  = User(id: "003", name: "john", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["吊儿郎当"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let patrick:User  = User(id: "004", name: "patrick", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["吊儿郎当"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
        let patrick2:User  = User(id: "005", name: "patrick", catchPhrase: "123", creationDate:Temporal.DateTime.now() , age: 29, weight: 75, nicknames:["吊儿郎当"], gender: Gender.male, location: nil, Pets: [Pet.init(id: "001", name: "Hummer", userID: "001")], Communities: []);
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
        Amplify.DataStore.save(patrick)
        Amplify.DataStore.save(patrick2)
        
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
    }
}
