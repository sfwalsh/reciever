//
//  AppScheme.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

enum AppScheme {
    case reciever
    case transmit
    
    static func currentScheme() -> AppScheme {
        let environmentDictionary = ProcessInfo.processInfo.environment
        
        if let _ = environmentDictionary["DEBUG_TRANSMIT"] {
            return AppScheme.transmit
        }
        
        return AppScheme.reciever
    }
}
