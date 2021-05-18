//
//  UserListEventHandler.swift
//  AWS
//
//  Created by Tom on 2021/4/26.
//

import Foundation

protocol UserListEventHandler : AnyObject {
    func tableViewCellSelected(indexPath:IndexPath)
}
