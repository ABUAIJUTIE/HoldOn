//
//  HOUIUtils.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import Foundation
import UIKit

class HOUIUtils: NSObject {
    
    static func createGradientLayer(layer: CALayer, frame: CGRect, colors: [Any]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.frame.origin = CGPoint.zero
        //设置渐变的主颜色
        gradientLayer.colors = colors
        //将gradientLayer作为子layer添加到主layer上
        layer.addSublayer(gradientLayer)
    }
    
}
