//
//  MockRecieverInteractor.swift
//  ReceiverTests
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class MockRecieverInteractor: RecieverInteractor {

    var lastHitId: Int?
    
    func unlockDoor(withId id: Int,
                    success: @escaping () -> Void,
                    failure: @escaping (DoorError) -> Void) {
        self.lastHitId = id
        success()
    }
}
