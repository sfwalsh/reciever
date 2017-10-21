//
//  ProfileView.swift
//  Receiver
//
//  Created by Stephen Walsh on 21/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

protocol ProfileView: class {
    var tableView: UITableView! {get set}
    
    func openDummyView(withTitle title: String)
}
