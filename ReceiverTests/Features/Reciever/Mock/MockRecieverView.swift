//
//  MockRecieverView.swift
//  ReceiverTests
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class MockRecieverView: NSObject, RecieverView {
    
    var presenter: RecieverViewPresenter?
    var mostRecentlyConnectBeaconId: Int?
    var mostRecentErrorDescription: String?
    
    func logConnection(toBeaconWithId beaconId: Int) {
        self,mostRecentlyConnectBeaconId = beaconId
    }
    
    func logError(error: Error) {
        self.mostRecentErrorDescription = error.localizedDescription
    }
}
