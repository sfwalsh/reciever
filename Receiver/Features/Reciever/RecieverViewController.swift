//
//  ViewController.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class RecieverViewController: UIViewController, RecieverView {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let maximumDistanceAllowed: Float = 0.5
    private let refreshInterval: TimeInterval = 4.0
    var presenter: RecieverViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        presenter.performInitialSetup()
    }
    
    private func setupPresenter() {
        let interactor = RecieverViewInteractor()
        let beaconInteractor = RecieverBeaconInteractor()
        self.presenter = RecieverViewPresenter(view: self,
                                               interactor: interactor,
                                               beaconInteractor: beaconInteractor,
                                               withMaximumDistanceToBeacon: maximumDistanceAllowed)
        presenter?.setupRefreshTimer(refreshInterval)
    }

    func showLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    func logConnection(toBeaconWithId beaconId: Int) {
        DispatchQueue.main.async {
            self.valueLabel.text = String(format: NSLocalizedString("RecieverView_connectionSuccess", comment: ""),
                                     beaconId)
        }
    }
    
    func logError(error: DoorError) {
        DispatchQueue.main.async {
            self.valueLabel.text = error.localizedDescription
        }
    }
}

