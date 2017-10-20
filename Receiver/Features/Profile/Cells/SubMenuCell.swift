//
//  SubMenuCell.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class SubMenuCell: UITableViewCell {
    
    func setup(title: String,
               image: UIImage?) {
        textLabel?.text = title
        imageView?.image = image
    }
}
