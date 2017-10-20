//
//  ReceiverTests.swift
//  ReceiverTests
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import XCTest
@testable import Receiver

class RecieverViewPresenterTests: XCTestCase {
    
    /*
     Intention: To test the potentially complicated logic of the RecieverViewPresenter
     */
    
    var mockView: MockRecieverView?
    var mockInteractor: MockRecieverInteractor?
    var mockBeaconInteractor: MockBeaconInteractor?
    var presenter: RecieverViewPresenter?
    
    override func setUp() {
        super.setUp()
        self.reset()
    }
    
    override func tearDown() {
        super.tearDown()
        self.reset()
    }
    
    private func reset() {
        self.mockView = MockRecieverView()
        self.mockInteractor = MockRecieverInteractor()
        self.mockBeaconInteractor = MockBeaconInteractor()
        
        // Note: Explicitly unwrapping only for testing.
        self.presenter = RecieverViewPresenter(view: mockView!,
                                               interactor: mockInteractor!,
                                               beaconInteractor: mockBeaconInteractor!,
                                               withMaximumDistanceToBeacon: 0.5)
    }
    
    func testSuccessfulConnection() {
        presenter?.attemptUnlockDoor()
        XCTAssertEqual(mockView?.mostRecentlyConnectBeaconId, mockBeaconInteractor?.dummyId)
        XCTAssertEqual(mockInteractor?.lastHitId, mockBeaconInteractor?.dummyId)
    }
    
    func testNoBeaconFoundConnectionError() {
        mockBeaconInteractor?.connectionError = BeaconConnectionError.noneFound
        presenter?.attemptUnlockDoor()
        XCTAssertNil(mockView?.mostRecentlyConnectBeaconId)
        XCTAssertNil(mockInteractor?.lastHitId)
        XCTAssertEqual(mockView?.mostRecentErrorDescription,
                       mockBeaconInteractor?.connectionError?.localizedDescription)
    }
    
    func testInvalidDistanceConnectionError() {
        mockBeaconInteractor?.connectionError = BeaconConnectionError.invalidDistance
        presenter?.attemptUnlockDoor()
        XCTAssertNil(mockView?.mostRecentlyConnectBeaconId)
        XCTAssertNil(mockInteractor?.lastHitId)
        XCTAssertEqual(mockView?.mostRecentErrorDescription,
                       mockBeaconInteractor?.connectionError?.localizedDescription)
    }
    
}
