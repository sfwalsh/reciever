//
//  DoorError.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

enum DoorError: Error {
    case invalidDistance
    case noneFound
    case network(description: String?)
    
    var localizedDescription: String {
        switch self {
        case .invalidDistance:
            return NSLocalizedString("DoorError_invalidDistance", comment: "")
        case .noneFound:
            return NSLocalizedString("DoorError_noneFound", comment: "")
        case .network(let description):
            return description ?? NSLocalizedString("DoorError_network", comment: "")
        }
    }
}
