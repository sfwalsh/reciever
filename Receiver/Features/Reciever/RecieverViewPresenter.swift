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
    
    func performInitialSetup() {
        view.hideLoader()
        beaconInteractor.startRangingBeacons()
    }
    
    func stopListeningForBeacons() {
        beaconInteractor.stopRangingBeacons()
    }
    
    func setupRefreshTimer(_ refreshInterval: TimeInterval) {
        Timer.scheduledTimer(withTimeInterval: refreshInterval,
                             repeats: true,
                             block: { (timer) in
                                self.attemptConnection()
        })
    }
    
    func attemptConnection() {
        view.showLoader()
        beaconInteractor.attemptConnectToBeacon(withMaximumDistanceToBeacon: maximumDistance,
                                                success: attemptUnlockDoor(withId:),
                                                failure: logError(error:))
    }
    
    func attemptUnlockDoor(withId id: Int) {
        interactor.unlockDoor(withId: id,
                              success: {
                                self.view.hideLoader()
                                self.view.logConnection(toBeaconWithId: id)
        },
                              failure: logError(error:))
    }
    
    func logError(error: DoorError) {
        view.hideLoader()
        view.logError(error: error)
    }
}
