//
//  TransmitterViewController.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class TransmitterViewController: UIViewController, ViewControllerInstantiable {
    
    static let viewControllerIdentifier: String = "TransmitterViewController"
    static let storyboardIdentifier: String = "Transmitter"
    
    var dummyBeaconBroadcaster: BeaconBroadcaster?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDummyBeaconBroadcaster()
    }
    
    private func setupDummyBeaconBroadcaster() {
        self.dummyBeaconBroadcaster = BeaconBroadcaster(withBeaconRegion: RecieverBeacon.defaultBeaconRegion)
    }
}
