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
    
    var presenter: RecieverViewPresenter?
    
    override func setUp() {
        super.setUp()
        self.resetPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
        self.resetPresenter()
    }
    
    private func resetPresenter() {
        let mockView = MockRecieverView()
        let mockInteractor = MockRecieverInteractor()
        self.presenter = RecieverViewPresenter(view: mockView,
                                               interactor: mockInteractor,
                                               withMaximumDistanceToBeacon: 0.5,
                                               refreshInterval: 4.0)
    }
    
    func testSuccessfulConnection() {
        
    }
    
    func testConnectionError() {
        
    }
    
}
