//
//  RoundImageView.swift
//  Receiver
//
//  Created by Stephen Walsh on 20/10/2017.
//  Copyright © 2017 Greenby Apps. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.mask = newMaskLayer(self.bounds)
    }
    
    private func newMaskLayer(_ rect: CGRect) -> CALayer {
        let path = UIBezierPath(ovalIn: rect).cgPath
        let maskLayer = CAShapeLayer()
        maskLayer.path = path
        
        return maskLayer
    }
}
