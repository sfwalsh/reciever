//
//  ProfileViewController.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileView, Presentable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ProfileViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }
    
    func setupPresenter() {
        presenter = ProfileViewPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    func openDummyView(withTitle title: String) {
        let dummyView = DummyViewController.instantiateInstance(withTitle: title)
        navigationController?.pushViewController(dummyView,
                                                 animated: true)
    }
}


