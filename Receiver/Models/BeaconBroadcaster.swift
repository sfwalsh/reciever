//
//  BeaconBroadcaster.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import CoreLocation
import CoreBluetooth

class BeaconBroadcaster: NSObject, CBPeripheralManagerDelegate {
    
    private let beaconRegion: CLBeaconRegion
    private var peripheralManager: CBPeripheralManager?
    
    init(withBeaconRegion beaconRegion: CLBeaconRegion) {
        self.beaconRegion = beaconRegion
        
        super.init()
        
        self.peripheralManager = CBPeripheralManager(delegate: self,
                                                     queue: nil)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            startBroadcasting(withBeaconRegion: beaconRegion)
        case .poweredOff, .resetting, .unauthorized, .unknown, .unsupported:
            break
        }
    }

    func startBroadcasting(withBeaconRegion beaconRegion: CLBeaconRegion) {

        let peripheralData = beaconRegion.peripheralData(withMeasuredPower: nil)
    
        if let peripheralDataDict = dictionaryForPeripheralData(peripheralData: peripheralData) {
            peripheralManager?.startAdvertising(peripheralDataDict)
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        
    }
    
    private func dictionaryForPeripheralData(peripheralData: NSMutableDictionary) -> [String: Any]? {
        guard let peripheralDataDict = peripheralData as? [String: Any] else {
            return nil
        }
        
        return peripheralDataDict
    }
}
