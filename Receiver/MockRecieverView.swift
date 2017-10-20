//
//  TestRecieverView.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class MockRecieverView: NSObject, RecieverView {
    
    var presenter: RecieverViewPresenter?
    
    func logConnection(toBeaconWithId beaconId: Int) {
        print("Successfully connected to beacon with id \(beaconId)")
    }
    
    func logError(error: Error) {
        print(error.localizedDescription)
    }
}
