//
//  BeaconInteractor.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

struct BeaconInteractor {
    
    private static let dummyId: Int = 5124
    
    static func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (_ beaconId: Int) -> Void,
                                failure: (Error) -> Void) {
        // Dummyid can be calculated from beacon's udid
        
        success(dummyId)
    }
}
