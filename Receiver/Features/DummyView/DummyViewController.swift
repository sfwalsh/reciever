//
//  DummyViewController.swift
//  Receiver
//
//  Created by Stephen Walsh on 21/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController, ViewControllerInstantiable {
    
    static let viewControllerIdentifier: String = "DummyViewController"
    static let storyboardIdentifier: String = "Dummy"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static func instantiateInstance(withTitle title: String) -> DummyViewController {
        let viewController = DummyViewController.instantiateInstance()
        viewController.title = title
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        titleLabel.text = title
    }
}
