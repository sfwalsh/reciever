//
//  BeaconBroadcaster.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import CoreLocation
import CoreBluetooth

class BeaconBroadcaster: NSObject, CBCentralManagerDelegate, CBPeripheralManagerDelegate {
    
    private let beaconRegion: CLBeaconRegion
    
    private var peripheralManager: CBPeripheralManager?
    private var centralManager: CBCentralManager?
    
    init(withBeaconRegion beaconRegion: CLBeaconRegion) {
        self.beaconRegion = beaconRegion
        
        super.init()
        self.peripheralManager = CBPeripheralManager(delegate: self,
                                                     queue: nil)
        self.centralManager = CBCentralManager(delegate: self,
                                               queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
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
    
    internal func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("updated state to \(peripheral.state)")
    }
    
    private func dictionaryForPeripheralData(peripheralData: NSMutableDictionary) -> [String: Any]? {
        guard let peripheralDataDict = peripheralData as? [String: Any] else {
            return nil
        }
        
        return peripheralDataDict
    }
}
