//
//  MockBeaconInteractor.swift
//  ReceiverTests
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class MockBeaconInteractor: BeaconInteractorable {
    
    var connectionError: DoorError?
    let dummyId: Int = 5124
    
    func attemptConnectToBeacon(withMaximumDistanceToBeacon maximumDistance: Float,
                                success: (Int) -> Void,
                                failure: (DoorError) -> Void) {
        if let error = self.connectionError {
            failure(error)
        } else {
            success(dummyId)
        }
    }
    
}
