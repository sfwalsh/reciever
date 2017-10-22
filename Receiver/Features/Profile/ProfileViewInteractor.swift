//
//  ProfileViewInteractor.swift
//  Receiver
//
//  Created by Stephen Walsh on 21/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

struct ProfileViewInteractor {
    
    func fetchProfileItems() -> [[ProfileItem]] {
        return [userInfoSection, editInfoSection, actionSection]
    }
    
    private var userInfoSection: [ProfileItem] {
        return [ProfileItem.userInfo]
    }
    
    private var editInfoSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "Name, Phone Numbers, Email", image: nil, textColour: UIColor.darkText),
            ProfileItem.subMenu(title: "Password & Security", image: nil, textColour: UIColor.darkText),
            ProfileItem.subMenu(title: "Payment & Shipping", image: nil, textColour: UIColor.darkText)
        ]
    }
    
    private var actionSection: [ProfileItem] {
        return [
            ProfileItem.subMenu(title: "iCloud", image: UIImage(named: "ActionImage"), textColour: UIColor.darkText),
            ProfileItem.subMenu(title: "iTunes & App Store", image: UIImage(named: "ActionImage"), textColour: UIColor.darkText),
            ProfileItem.subMenu(title: "Set Up Family Sharing...", image: UIImage(named: "ActionImage"), textColour: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        ]
    }
}
