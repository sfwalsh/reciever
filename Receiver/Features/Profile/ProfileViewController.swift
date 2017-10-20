//
//  ProfileViewController.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

private struct CellIdentifiers {
    static let userInfo = "userInfo"
    static let subMenu = "subMenu"
}

private enum ProfileItem {
    case userInfo
    case subMenu(title: String, image: UIImage?, action: (() -> Void))
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var items: [[ProfileItem]] {
        return [[.userInfo], editInfoSection, actionSection]
    }
    private var editInfoSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "Name, Phone Numbers, Email", image: nil, action: {
                
            }),
            ProfileItem.subMenu(title: "Password & Security", image: nil, action: {
                
            }),
            ProfileItem.subMenu(title: "Payment & Shipping", image: nil, action: {
                
            })
        ]
    }
    
    private var actionSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "Action One", image: UIImage(), action: {
                
            }),
            ProfileItem.subMenu(title: "Action Two", image: UIImage(), action: {
                
            }),
            ProfileItem.subMenu(title: "Action Three", image: UIImage(), action: {
                
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.section][indexPath.row]
        switch item {
        case .subMenu(_, _, let action):
            action()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section][indexPath.row]
        switch item {
        case .userInfo:
            return 175.0
        default:
            return 45.0
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section][indexPath.row]
        switch item {
        case .userInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.userInfo, for: indexPath) as! UserInfoCell
            cell.setup(withName: User.current.name,
                       image: User.current.image)
            return cell
        case .subMenu(let title, let image, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.subMenu, for: indexPath) as! SubMenuCell
            cell.setup(title: title,
                       image: image)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = items[section]
        return section.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
}
