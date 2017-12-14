//
//  HOLayer.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import Foundation
import UIKit

extension CAGradientLayer {
    
    func rainbow(theFrame: CGRect, theColors: [Any]) -> CAGradientLayer {
        self.frame = theFrame
        self.colors = theColors
        return self
    }
    
    func rainbowLayer() -> CAGradientLayer {
        //定义渐变的颜色（7种彩虹色）
        let gradientColors = [UIColor.red.cgColor,
                              UIColor.orange.cgColor,
                              UIColor.yellow.cgColor,
                              UIColor.green.cgColor,
                              UIColor.cyan.cgColor,
                              UIColor.blue.cgColor,
                              UIColor.purple.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        
        return self
    }
}
