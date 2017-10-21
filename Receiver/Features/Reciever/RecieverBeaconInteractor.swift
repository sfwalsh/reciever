//
//  BeaconInteractor.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import CoreLocation

class RecieverBeaconInteractor: NSObject, BeaconInteractorable {
    
    private let dummyId: Int = 5124
    
    let locationManager: CLLocationManager
    let beaconRegion: CLBeaconRegion
    var lastRangedBeacons: [CLBeacon]
    
    override init() {
        self.locationManager = CLLocationManager()
        // MARK: FIXME - UUID
        self.beaconRegion = CLBeaconRegion(proximityUUID: UUID(),
                                           identifier: "Reciever-Test")
        self.lastRangedBeacons = []
        
        super.init()
        
        locationManager.delegate = self
    }
    
    func startRangingBeacons() {
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func stopRangingBeacons() {
        locationManager.stopRangingBeacons(in: beaconRegion)
    }
    
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (_ beaconId: Int) -> Void,
                                failure: (DoorError) -> Void) {
        
        guard lastRangedBeacons.count > 0 else {
            failure(DoorError.noneFound)
            return
        }
        
        // MARK: FIXME - ~50cm or less
        guard lastRangedBeacons.filter({Float($0.proximity.rawValue) < maximumDistance}).count > 0 else {
            failure(DoorError.invalidDistance)
            return
        }
        
        success(dummyId)
    }
}

extension RecieverBeaconInteractor: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didRangeBeacons beacons: [CLBeacon],
                         in region: CLBeaconRegion) {
        lastRangedBeacons = beacons
    }
}
