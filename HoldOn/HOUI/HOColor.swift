//
//  HOColor.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func dark() -> UIColor {
        return UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
    }
    
    class func backgroundGary() -> UIColor {
        return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    }
    
    class func buttonGary() -> UIColor {
        return UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
    }
    
    class func mainYellow() -> UIColor {
        return UIColor(red: 254/255, green: 214/255, blue: 0/255, alpha: 1)
    }
    
    class func colorWithRGB(_ R: CGFloat,_ G: CGFloat,_ B: CGFloat) -> UIColor {
        return UIColor(red: R/255, green: G/255, blue: B/255, alpha: 1)
    }
    
}
