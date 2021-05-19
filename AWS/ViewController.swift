//
//  ViewController.swift
//  AWS
//
//  Created by Tom on 2021/4/24.
//

import UIKit
import Amplify
import Combine
 
 


class ViewController: UIViewController {
    var todoSubscription: AnyCancellable?
    
    lazy var listView:UserListView = {
        let view  = UserListView()
        view.frame = self.view.bounds
        view.eventHandleDelegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.listView);
        self.navigationItem.title  = "首页"
        let BtnItem = UIBarButtonItem.init(title: "新增", style: .done, target: self, action: #selector(titleBarButtonItemMethod))

        
        let naviItem = BtnItem
        self.navigationItem.rightBarButtonItem = naviItem
        
//        
//        self.todoSubscription =  Amplify.DataStore.publisher(for: User.self)
//            .sink(receiveCompletion: { completion in
//                           print("Subscription has been completed: \(completion)")
//                       }, receiveValue: { mutationEvent in
//                           print("Subscription got this value: \(mutationEvent)")
//
//                           do {
//                             let user = try mutationEvent.decodeModel(as: User.self)
//
//                             switch mutationEvent.mutationType {
//                             case "create":
//                               print("Created: \(user)")
//                             case "update":
//                               print("Updated: \(user)")
//                             case "delete":
//                               print("Deleted: \(user)")
//                             default:
//                               break
//                             }
//
//                           } catch {
//                             print("Model could not be decoded: \(error)")
//                           }
//                       })
//        
        reloadDatasource()
    
    }

    func reloadDatasource()  {
        self.listView.dataSource.removeAll()
     
        
        Amplify.DataStore.query(User.self) { result in
            switch(result) {
            case .success(let items):
                for item in items {
                    print("Community ID: \(item.id)")
                    self.listView.dataSource.append(item)
                    
                }
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
            self.listView.tableView.reloadData()
        }
        
    }
    
    @objc func titleBarButtonItemMethod() {
        DataService().saveRandomUserData()
        
        reloadDatasource()
//        let vc = EditViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController :UserListEventProtocol {
    func tableViewCellSelected(indexPath: IndexPath) {
        print(indexPath)
    }
}
