//
//  APIRouter.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

struct APIRouter {
    
    private static let domain = "https://api.getkisi.com"
    
    private static var authorizationHeader: [String: Any]? {
        return ["Authorization": "KISI-LINK 75388d1d1ff0dff6b7b04a7d5162cc6c"]
    }
    
    static func unlockDoor(withId id: Int,
                           success: @escaping () -> Void,
                           failure: @escaping (DoorError) -> Void) {
        let path = "/locks/\(id)/access"
        let urlString = domain+path
        
        guard let url = URL(string: urlString) else {
            failure(DoorError.network(description: nil))
            return
        }
        
        showNetworkIndicator()
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let session = authorizedSession()
        let task = session.dataTask(with: request)
        { (data, response, error) in
            hideNetworkIndicator()
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                success()
                return
            } else {
                failure(DoorError.network(description: error?.localizedDescription))
                return
            }
        }
        
        task.resume()
    }
    
    private static func authorizedSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = authorizationHeader
        
        let urlSession = URLSession(configuration: sessionConfiguration)
        return urlSession
    }
    
    internal static func showNetworkIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    internal static func hideNetworkIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
