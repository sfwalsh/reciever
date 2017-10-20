//
//  RecieverViewInteractor.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

struct RecieverViewInteractor: RecieverInteractor {
    
    func unlockDoor(withId id: Int) {
        APIRouter.unlockDoor(withId: id)
    }
}
