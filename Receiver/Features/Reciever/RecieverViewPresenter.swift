//
//  RecieverViewPresenter.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

class RecieverViewPresenter: NSObject {
    
    unowned let view: RecieverView
    private let interactor: RecieverInteractor
    private let maximumDistance: Float
    private var timer: Timer?
    
    init(view: RecieverView,
         interactor: RecieverInteractor,
         withMaximumDistanceToBeacon maximumDistance: Float,
         refreshInterval: TimeInterval) {
        self.view = view
        self.interactor = interactor
        self.maximumDistance = maximumDistance
        super.init()
        
        setupRefreshTimer(refreshInterval)
    }
    
    fileprivate func setupRefreshTimer(_ refreshInterval: TimeInterval) {
        self.timer = Timer.scheduledTimer(withTimeInterval: refreshInterval,
                                          repeats: true,
                                          block: { [weak self] (timer) in
                                          self?.attemptUnlockDoor()
        })
        
    }
    
    func attemptUnlockDoor() {
        BeaconInteractor.attemptConnectToBeacon(withMaximumDistanceToBeacon: maximumDistance,
                                                success: { [weak self] (beaconId) in
                                                    self?.view.logConnection(toBeaconWithId: beaconId)
                                                    self?.interactor.unlockDoor(withId: beaconId)
        }) { [weak self] (error) in
            self?.view.logError(error: error)
        }
    }
}
