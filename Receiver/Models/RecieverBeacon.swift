//
//  RecieverBeacon.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import CoreLocation

struct RecieverBeacon {
    private static let uuid = UUID(uuidString: "447323A8-2F54-46C8-B2FD-25DA7D847725")!
    private static let id = "com.greenby.Reciever.test"
    private static let majorIdentifier: CLBeaconMajorValue = 100
    private static let minorIdentifier: CLBeaconMinorValue = 5873
    
    static func fetchDefaultBeaconRegion() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid,
                       major: majorIdentifier,
                       minor: minorIdentifier,
                       identifier: id)
        
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        beaconRegion.notifyEntryStateOnDisplay = true
        
        return beaconRegion
    }
}
