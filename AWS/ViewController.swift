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
        self.navigationItem.title  = "首页"
        let BtnItem = UIBarButtonItem.init(title: "新增", style: .done, target: self, action: #selector(titleBarButtonItemMethod))

        
        let naviItem = BtnItem
        self.navigationItem.rightBarButtonItem = naviItem
        
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
        let vc = EditViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController :UserListEventProtocol {
    func tableViewCellSelected(indexPath: IndexPath) {
        print(indexPath)
    }
}
