//
//  BeaconInteractorable.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

protocol BeaconInteractorable {
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                       success: (_ beaconId: Int) -> Void,
                                       failure: (DoorError) -> Void)
}
