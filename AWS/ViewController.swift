//
//  ViewController.swift
//  AWS
//
//  Created by Tom on 2021/4/24.
//

import UIKit
import Amplify
 

class ViewController: UIViewController {

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


}

extension ViewController :UserListEventHandler {
    func tableViewCellSelected(indexPath: IndexPath) {
        print(indexPath)
    }
}
