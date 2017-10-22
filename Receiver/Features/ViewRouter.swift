//
//  ViewRouter.swift
//  Receiver
//
//  Created by Stephen Walsh on 22/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

struct ViewRouter {
    
    static func setInitialRootViewControllerForScheme(scheme: AppScheme,
                                                      onWindow window: UIWindow?) {
        switch scheme {
        case .reciever:
            let recieverFlow = newRecieverFlow()
            setRootViewController(newRootView: recieverFlow,
                                  onWindow: window)
        case .transmit:
            let transmitterView = newTransmitterView()
            setRootViewController(newRootView: transmitterView,
                                  onWindow: window)
        }
    }
    
    static func newRecieverFlow() -> UIViewController {
        let recieverFlow = UIStoryboard(name: "Reciever", bundle: nil).instantiateInitialViewController()!
        return recieverFlow
    }
    
    static func newTransmitterView() -> TransmitterViewController {
        let transmitterView = TransmitterViewController.instantiateInstance()
        return transmitterView
    }
    
    static func setRootViewController(newRootView: UIViewController,
                                      onWindow window: UIWindow?) {
        window?.rootViewController = newRootView
        window?.makeKeyAndVisible()
    }
}
