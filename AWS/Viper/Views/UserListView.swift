//
//  UserListView.swift
//  AWS
//
//  Created by Tom on 2021/4/26.
//

import Foundation
import UIKit



class UserListView: UIView  {
    
    weak var eventHandleDelegate : UserListEventProtocol?
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.grouped)
        tableView.delegate = self;
        tableView.dataSource = self;
        self.addSubview(tableView)
        return tableView
    }()
    
    lazy var dataSource = {
       return []
    }()
    
    override func layoutSubviews() {
        tableView.frame = self.bounds
    }
    
    
   
}


extension UserListView:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

extension UserListView:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UserCell")
        let user :User = self.dataSource[indexPath.row] as! User
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.nicknames?[0]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        eventHandleDelegate?.tableViewCellSelected(indexPath: indexPath);
    }
}

