//
//  ProfileViewPresenter.swift
//  Receiver
//
//  Created by Stephen Walsh on 21/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

private enum SectionType: Int {
    case userInfo = 0
    case editInfo = 1
    case action = 2
}

class ProfileViewPresenter: NSObject {
    
    private struct CellIdentifiers {
        static let userInfo = "userInfo"
        static let subMenu = "subMenu"
    }
    
    unowned let view: ProfileView
    let interactor: ProfileViewInteractor
    let items: [[ProfileItem]]
    
    init(view: ProfileView) {
        self.view = view
        self.interactor = ProfileViewInteractor()
        self.items = interactor.fetchProfileItems()
        super.init()
        setupTableView()
    }
    
    func viewDidLoad() {
        view.tableView.reloadData()
    }
    
    internal func setupTableView() {
        view.tableView.delegate = self
        view.tableView.dataSource = self
    }
}


// MARK: UITableViewDelegate & UITableViewDataSource Impl
extension ProfileViewPresenter: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.section][indexPath.row]
        switch item {
        case .subMenu(let title, _):
            view.openDummyView(withTitle: title)
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
        case .subMenu(let title, let image):
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
