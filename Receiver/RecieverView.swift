//
//  RecieverView.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

protocol RecieverView: class {
    func logConnection(toBeaconWithId beaconId: Int)
    func logError(error: Error)
}
