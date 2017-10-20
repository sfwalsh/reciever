//
//  BeaconConnectionError.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

enum BeaconConnectionError: Error {
    case invalidDistance
    case noneFound
    
    var localizedDescription: String {
        switch self {
        case .invalidDistance:
            return "No doors found in range"
        case .noneFound:
            return "No doors found"
        }
    }
}
