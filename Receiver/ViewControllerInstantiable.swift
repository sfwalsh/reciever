//
//  ViewControllerInstantiable.swift
//  Receiver
//
//  Created by Stephen Walsh on 21/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

protocol ViewControllerInstantiable {
    
    static var viewControllerIdentifier: String {get}
    static var storyboardIdentifier: String {get}
}

extension ViewControllerInstantiable where Self: UIViewController {
    
    static func instantiateInstance() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! Self
        
        return viewController
    }
}
