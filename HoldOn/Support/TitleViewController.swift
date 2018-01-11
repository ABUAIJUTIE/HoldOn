//
//  TitleViewController.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/28.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class TitleViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var button: UIButton!
    var label_1: UILabel!
    var label_2: UILabel!
    var label_3: UILabel!
    var label_4: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.width
        let screenHeight = screenFrame.height
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 96))
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        
        
        label_1 = UILabel()
        label_2 = UILabel()
        label_3 = UILabel()
        label_4 = UILabel()
        
//        label_1 = UILabel(frame: CGRect(x: 20, y: 48, width: 65, height: 39))
//        label_2 = UILabel(frame: CGRect(x: 105, y: 48, width: 41, height: 24))
//        label_3 = UILabel(frame: CGRect(x: 169, y: 48, width: 41, height: 24))
//        label_4 = UILabel(frame: CGRect(x: 233, y: 48, width: 41, height: 24))
        view.addSubview(label_1)
        view.addSubview(label_2)
        view.addSubview(label_3)
        view.addSubview(label_4)
        label_1.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(65)
            make.height.equalTo(39)
            make.bottom.equalTo(96)
            make.left.equalTo(20)
        }
        label_2.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(41)
            make.height.equalTo(24)
            make.bottom.equalTo(96)
            make.left.equalTo(105)
        }
        label_3.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(41)
            make.height.equalTo(24)
            make.bottom.equalTo(96)
            make.left.equalTo(169)
        }
        label_4.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(41)
            make.height.equalTo(24)
            make.bottom.equalTo(96)
            make.left.equalTo(233)
        }
        label_1.font = UIFont.boldSystemFont(ofSize: 32)
        label_2.font = UIFont.boldSystemFont(ofSize: 20)
//        label_2.transform = CGAffineTransform(scaleX: 0.32, y: 0.32)
        label_3.font = UIFont.boldSystemFont(ofSize: 20)
        label_4.font = UIFont.boldSystemFont(ofSize: 20)
        label_1.text = "今天"
        label_2.text = "跑步"
        label_3.text = "骑行"
        label_4.text = "步行"
        label_1.textAlignment = .left
        label_2.textAlignment = .left
        label_3.textAlignment = .left
        label_4.textAlignment = .left
//        label_1.sizeToFit()
//        label_2.sizeToFit()
//        label_3.sizeToFit()
//        label_4.sizeToFit()
        label_2.layer.anchorPoint = CGPoint(x: 0, y: 1)
//        view.addSubview(label_1)
//        view.addSubview(label_2)
//        view.addSubview(label_3)
//        view.addSubview(label_4)
//        print(label_1.frame.size)
//        print(label_2.frame.size)
        
        button = UIButton()
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(120)
            make.height.equalTo(48)
            make.center.equalTo(self.view)
        }
        button.setTitle("CLICK", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(moveLabel), for: .touchUpInside)
    
    }
    
    @objc private func moveLabel() {
        UIView.animate(withDuration: 1, animations: {
            self.label_2.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            self.label_1.snp.updateConstraints({ (make) -> Void in
                make.left.equalTo(-65)
            })
            self.label_2.snp.updateConstraints({ (make) -> Void in
                make.left.equalTo(20)
            })
            self.label_3.snp.updateConstraints({ (make) -> Void in
                make.left.equalTo(105)
            })
            self.label_4.snp.updateConstraints({ (make) -> Void in
                make.left.equalTo(169)
            })
            self.view.layoutIfNeeded()
            
//            self.label_1.frame = CGRect(x: -65, y: 48, width: 65, height: 96)
//            self.label_2.frame = CGRect(x: 20, y: 48, width: 120, height: 96)
//            self.label_3.frame = CGRect(x: 105, y: 48, width: 120, height: 96)
//            self.label_4.frame = CGRect(x: 260, y: 48, width: 120, height: 96)
//            self.label_1.sizeToFit()
//            self.label_2.sizeToFit()
//            self.label_3.sizeToFit()
//            self.label_4.sizeToFit()
           
        }) { (finished:Bool) -> Void in
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
