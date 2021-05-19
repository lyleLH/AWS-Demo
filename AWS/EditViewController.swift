//
//  EditViewController.swift
//  AWS
//
//  Created by Tom.Liu on 2021/5/19.
//

import Foundation
import UIKit
import Amplify
 

class EditViewController: UIViewController {

    lazy var listView:ContentEditView = {
        let view  = Bundle.main.loadNibNamed("ContentEditView", owner: nil, options: nil)?.last as! ContentEditView
        view.frame = self.view.bounds
 
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.listView);
        self.navigationItem.title  = "New Record"
        let BtnItem = UIBarButtonItem.init(title: "Save", style: .done, target: self, action: #selector(titleBarButtonItemMethod))

        
        let naviItem = BtnItem
        self.navigationItem.rightBarButtonItem = naviItem
        
      
    }

    @objc func titleBarButtonItemMethod() {
        
    }
}
 
