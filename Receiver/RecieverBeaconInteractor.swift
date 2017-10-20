//
//  BeaconInteractor.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

struct RecieverBeaconInteractor: BeaconInteractorable {
    
    // Dummyid could be calculated from beacon's udid
    private let dummyId: Int = 5124
    
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (_ beaconId: Int) -> Void,
                                failure: (BeaconConnectionError) -> Void) {
        success(dummyId)
    }
}
