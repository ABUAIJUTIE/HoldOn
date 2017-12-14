//
//  WalkingPageVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class WalkingPageVC: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var kmLabel: UILabel!
    var goBtn: UIButton!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let visibleHeight = UIScreen.main.bounds.size.height - 133
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUI() {
        /* ScrollView */
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.height.equalTo(visibleHeight)
            make.top.equalTo(view)
            make.left.equalTo(view)
        }
        scrollView.backgroundColor = .backgroundGary()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        //        scrollView.bounces = true
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        
        /* 第一部分 */
        let mainView = UIView()
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.width.equalTo(screenWidth)
            make.height.equalTo(visibleHeight)
        }
        mainView.backgroundColor = .white
        
        /* 背景 */
        let bgMap = UIImageView()
        mainView.addSubview(bgMap)
        bgMap.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(mainView)
            make.center.equalTo(mainView)
        }
        bgMap.image = #imageLiteral(resourceName: "map_with_white_1")
        bgMap.contentMode = .scaleAspectFill
        
        /* 公里数 */
        kmLabel = UILabel()
        mainView.addSubview(kmLabel)
        kmLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView)
            make.centerY.equalTo(mainView).offset(-80)
        }
        kmLabel.text = "4.20"
        kmLabel.textColor = .dark()
        kmLabel.font = .numberFont(size: 76)
        kmLabel.sizeToFit()
        
        /* 标签 */
        let kmTag = UILabel()
        mainView.addSubview(kmTag)
        kmTag.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView)
            make.top.equalTo(kmLabel.snp.bottom).offset(8)
        }
        kmTag.text = "总公里数"
        kmTag.textColor = .dark()
        kmTag.font = .systemFont(ofSize: 12)
        kmTag.sizeToFit()
        
        /* 开跑 */
        goBtn = UIButton()
        mainView.addSubview(goBtn)
        goBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(160)
            make.height.equalTo(48)
            make.centerX.equalTo(mainView)
            make.bottom.equalTo(mainView).offset(-60)
        }
        goBtn.setBackgroundImage(#imageLiteral(resourceName: "button_bg"), for: .normal)
        goBtn.setTitle("开始行走", for: .normal)
        goBtn.setTitleColor(.dark(), for: .normal)
        goBtn.contentMode = UIViewContentMode.scaleToFill
        goBtn.layer.cornerRadius = 24
        goBtn.layer.masksToBounds = true
        
        /* 第二部分 */
        let secondView = UIView()
        scrollView.addSubview(secondView)
        secondView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(mainView.snp.bottom).offset(12)
            make.left.equalTo(mainView)
            make.width.equalTo(screenWidth)
            make.height.equalTo(400)
            make.bottom.equalTo(scrollView)
        }
        secondView.backgroundColor = .white
        
    }

}
