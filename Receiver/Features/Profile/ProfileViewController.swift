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

private enum SectionType: Int {
    case userInfo = 0
    case editInfo = 1
    case action = 2
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var items: [[ProfileItem]] {
        return [[.userInfo], editInfoSection, actionSection]
    }
    
    private var editInfoSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "Name, Phone Numbers, Email", image: nil, action: { [weak self] in
                self?.openDummyView(withTitle: "Name, Phone Numbers, Email")
            }),
            ProfileItem.subMenu(title: "Password & Security", image: nil, action: { [weak self] in
                self?.openDummyView(withTitle: "Password & Security")
            }),
            ProfileItem.subMenu(title: "Payment & Shipping", image: nil, action: { [weak self] in
                self?.openDummyView(withTitle: "Payment & Shipping")
            })
        ]
    }
    
    private var actionSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "iCloud", image: UIImage(named: "ActionImage"), action: { [weak self] in
                self?.openDummyView(withTitle: "iCloud")
            }),
            ProfileItem.subMenu(title: "iTunes & App Store", image: UIImage(named: "ActionImage"), action: { [weak self] in
                self?.openDummyView(withTitle: "iTunes & App Store")
            }),
            ProfileItem.subMenu(title: "Set Up Family Sharing...", image: UIImage(named: "ActionImage"), action: { [weak self] in
                self?.openDummyView(withTitle: "Set Up Family Sharing...")
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    func openDummyView(withTitle title: String) {
        let dummyView = DummyViewController.instantiateInstance(withTitle: title)
        navigationController?.pushViewController(dummyView,
                                                 animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.section][indexPath.row]
        switch item {
        case .subMenu(_, _, let action):
            action()
            tableView.deselectRow(at: indexPath, animated: true)
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
        switch section {
        case SectionType.action.rawValue:
            return 30
        case SectionType.editInfo.rawValue:
            return 30
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        return view
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
