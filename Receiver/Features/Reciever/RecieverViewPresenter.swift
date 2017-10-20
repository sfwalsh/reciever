//
//  RecieverViewPresenter.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import Foundation

struct RecieverViewPresenter {
    
    unowned let view: RecieverView
    private let interactor: RecieverInteractor
    private let beaconInteractor: BeaconInteractorable
    private let maximumDistance: Float
    
    init(view: RecieverView,
         interactor: RecieverInteractor,
         beaconInteractor: BeaconInteractorable,
         withMaximumDistanceToBeacon maximumDistance: Float) {
        self.view = view
        self.interactor = interactor
        self.beaconInteractor = beaconInteractor
        self.maximumDistance = maximumDistance
    }
    
    func setupRefreshTimer(_ refreshInterval: TimeInterval) {
        Timer.scheduledTimer(withTimeInterval: refreshInterval,
                             repeats: true,
                             block: { (timer) in
                                self.attemptUnlockDoor()
        })
    }
    
    func attemptUnlockDoor() {
        beaconInteractor.attemptConnectToBeacon(withMaximumDistanceToBeacon: maximumDistance,
                                                success: { (beaconId) in
                                                    self.view.logConnection(toBeaconWithId: beaconId)
                                                    self.interactor.unlockDoor(withId: beaconId)
        }) { (error) in
            self.view.logError(error: error)
        }
    }
}
