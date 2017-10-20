//
//  MockBeaconInteractor.swift
//  ReceiverTests
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class MockBeaconInteractor: BeaconInteractorable {
    
    var connectionAttemptShouldSucceed: Bool = true
    var connectionError: BeaconConnectionError = BeaconConnectionError.invalidDistance
    let dummyId: Int = 5124
    
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (Int) -> Void,
                                failure: (BeaconConnectionError) -> Void) {
        if connectionAttemptShouldSucceed {
            success(dummyId)
        } else {
            failure(connectionError)
        }
    }
    
}
