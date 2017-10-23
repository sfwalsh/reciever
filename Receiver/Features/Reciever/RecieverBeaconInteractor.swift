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
        self.beaconRegion = RecieverBeacon.fetchDefaultBeaconRegion()
        
        self.lastRangedBeacons = []
        
        super.init()
        
        locationManager.delegate = self
        assertCorrectAuthorizationStatus()
    }
    
    private func assertCorrectAuthorizationStatus() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func startMonitoringBeacons() {
        if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
            locationManager.startMonitoring(for: beaconRegion)
        }
    }
    
    func stopMonitoringBeacons() {
        locationManager.stopMonitoring(for: beaconRegion)
    }
    
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (_ beaconId: Int) -> Void,
                                failure: (DoorError) -> Void) {
        
        guard let nearestBeacon = lastRangedBeacons.first else {
            failure(DoorError.noneFound)
            return
        }
        
        switch nearestBeacon.proximity {
        case .immediate:
            let doorId = calculateDoorId(forBeacon: nearestBeacon)
            success(doorId)
        default:
            failure(DoorError.invalidDistance)
        }
    }
    
    private func calculateDoorId(forBeacon beacon: CLBeacon) -> Int {
        // Calculate based on Major/Minor identifier
        return dummyId
    }
}


// MARK: Helpers
extension RecieverBeaconInteractor {
    
    fileprivate func startRangingBeacons(inRegion region: CLBeaconRegion) {
        locationManager.startRangingBeacons(in: region)
    }
    
    fileprivate func stopRangingBeacons(inRegion region: CLBeaconRegion) {
        locationManager.stopRangingBeacons(in: region)
    }
}


// MARK: CLLocationManagerDelegate Implementation
extension RecieverBeaconInteractor: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        locationManager.requestState(for: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didDetermineState state: CLRegionState,
                         for region: CLRegion) {
        switch state {
        case .inside:
            attemptStartRangingBeacons(region)
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        attemptStartRangingBeacons(region)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if let beaconRegion = region as? CLBeaconRegion {
            stopRangingBeacons(inRegion: beaconRegion)
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didRangeBeacons beacons: [CLBeacon],
                         in region: CLBeaconRegion) {
        lastRangedBeacons = beacons
    }
    
    
    private func attemptStartRangingBeacons(_ region: CLRegion) {
        if let beaconRegion = region as? CLBeaconRegion {
            
            if CLLocationManager.isRangingAvailable() {
                startRangingBeacons(inRegion: beaconRegion)
            }
        }
    }
}
