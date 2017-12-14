//
//  FitPageVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit

class FitPageVC: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var dayLabel: UILabel!
    var minLabel: UILabel!
    var rankLabel: UILabel!
    var goBtn: UIButton!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let visibleHeight = UIScreen.main.bounds.size.height - 133
    let quarterScreenWidth = UIScreen.main.bounds.size.width / 4
    
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
        
        /* 数据 - 第一部分 */
        let mainView = UIView()
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.width.equalTo(screenWidth)
            make.height.equalTo(248)
        }
        mainView.backgroundColor = .white

        /* 天数 */
        dayLabel = UILabel()
        mainView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView)
            make.top.equalTo(mainView).offset(20)
        }
        dayLabel.text = "69"
        dayLabel.textColor = .dark()
        dayLabel.font = .numberFont(size: 76)
        dayLabel.sizeToFit()
        
        /* 标签 */
        let dayTag = UILabel()
        mainView.addSubview(dayTag)
        dayTag.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView)
            make.top.equalTo(dayLabel.snp.bottom).offset(4)
        }
        dayTag.text = "总天数"
        dayTag.textColor = .dark()
        dayTag.font = .systemFont(ofSize: 12)
        dayTag.sizeToFit()
        
        /* 分钟数 */
        minLabel = UILabel()
        mainView.addSubview(minLabel)
        minLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView).offset(-quarterScreenWidth)
            make.top.equalTo(dayTag.snp.bottom).offset(20)
        }
        minLabel.text = "512"
        minLabel.textColor = .dark()
        minLabel.font = .numberFont(size: 48)
        minLabel.sizeToFit()
        
        /* 标签 */
        let minTag = UILabel()
        mainView.addSubview(minTag)
        minTag.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView).offset(-quarterScreenWidth)
            make.top.equalTo(minLabel.snp.bottom).offset(6)
        }
        minTag.text = "分钟数"
        minTag.textColor = .dark()
        minTag.font = .systemFont(ofSize: 12)
        minTag.sizeToFit()
        
        /* 排名 */
        rankLabel = UILabel()
        mainView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView).offset(quarterScreenWidth)
            make.top.equalTo(dayTag.snp.bottom).offset(20)
        }
        rankLabel.text = "3"
        rankLabel.textColor = .dark()
        rankLabel.font = .numberFont(size: 48)
        rankLabel.sizeToFit()
        
        /* 标签 */
        let rankTag = UILabel()
        mainView.addSubview(rankTag)
        rankTag.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(mainView).offset(quarterScreenWidth)
            make.top.equalTo(rankLabel.snp.bottom).offset(6)
        }
        rankTag.text = "排名"
        rankTag.textColor = .dark()
        rankTag.font = .systemFont(ofSize: 12)
        rankTag.sizeToFit()
        
        /* 今天 - 第二部分 */
        let todayView = UIView()
        scrollView.addSubview(todayView)
        todayView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(400)
            make.top.equalTo(mainView.snp.bottom).offset(12)
            make.left.equalTo(mainView)
            make.bottom.equalTo(scrollView)
        }
        todayView.backgroundColor = .white
        
        let titleView = HOBaseView()
        todayView.addSubview(titleView)
        titleView.setup(titleText: "今天", withButton: true)
        titleView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(todayView)
            make.height.equalTo(52)
            make.top.equalTo(todayView)
            make.left.equalTo(todayView)
        }
        
        let shadowView = UIView()
        todayView.addSubview(shadowView)
        shadowView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.left.equalTo(todayView).offset(16)
            make.bottom.equalTo(titleView.snp.bottom).offset(136)
        }
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.cornerRadius = 12
//        shadowView.layer.shadowColor = UIColor.colorWithRGB(239, 72, 54).cgColor
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 12)
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowRadius = 20
        
        let testView1 = UIView()
        todayView.addSubview(testView1)
        testView1.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.left.equalTo(todayView).offset(16)
        }
        testView1.superview!.setNeedsLayout()
        testView1.superview!.layoutIfNeeded()
        let colors = [UIColor.colorWithRGB(226, 106, 106).withAlphaComponent(0.5).cgColor, UIColor.colorWithRGB(239, 72, 54).withAlphaComponent(0.5).cgColor]
        testView1.layer.cornerRadius = 12
        testView1.layer.masksToBounds = true
        HOUIUtils.createGradientLayer(layer: testView1.layer, frame: testView1.frame, colors: colors)
        
        let shadowView2 = UIView()
        todayView.addSubview(shadowView2)
        shadowView2.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.right.equalTo(todayView).offset(-16)
            make.bottom.equalTo(titleView.snp.bottom).offset(136)
        }
        shadowView2.backgroundColor = UIColor.white
        shadowView2.layer.cornerRadius = 12
//        shadowView2.layer.shadowColor = UIColor.colorWithRGB(34, 167, 240).cgColor
        shadowView2.layer.shadowColor = UIColor.black.cgColor
        shadowView2.layer.shadowOffset = CGSize(width: 0, height: 12)
        shadowView2.layer.shadowOpacity = 0.1
        shadowView2.layer.shadowRadius = 20
        
        let testView2 = UIView()
        todayView.addSubview(testView2)
        testView2.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.right.equalTo(todayView).offset(-16)
        }
        testView2.superview!.setNeedsLayout()
        testView2.superview!.layoutIfNeeded()
        let colors2 = [UIColor.colorWithRGB(25, 181, 254).withAlphaComponent(0.5).cgColor, UIColor.colorWithRGB(34, 167, 240).withAlphaComponent(0.5).cgColor]
        testView2.layer.cornerRadius = 12
        testView2.layer.masksToBounds = true
        HOUIUtils.createGradientLayer(layer: testView2.layer, frame: testView2.frame, colors: colors2)
        
        let shadowView3 = UIView()
        todayView.addSubview(shadowView3)
        shadowView3.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.left.equalTo(testView1)
            make.bottom.equalTo(testView1.snp.bottom).offset(136)
        }
        shadowView3.backgroundColor = UIColor.white
        shadowView3.layer.cornerRadius = 12
//        shadowView3.layer.shadowColor = UIColor.colorWithRGB(249, 191, 59).cgColor
        shadowView3.layer.shadowColor = UIColor.black.cgColor
        shadowView3.layer.shadowOffset = CGSize(width: 0, height: 12)
        shadowView3.layer.shadowOpacity = 0.1
        shadowView3.layer.shadowRadius = 20
        
        let testView3 = UIView()
        todayView.addSubview(testView3)
        testView3.snp.makeConstraints { (make) -> Void in
            make.width.equalTo((screenWidth - 48) / 2)
            make.height.equalTo(120)
            make.top.equalTo(testView1.snp.bottom).offset(16)
            make.left.equalTo(testView1)
        }
        testView3.superview!.setNeedsLayout()
        testView3.superview!.layoutIfNeeded()
        let colors3 = [UIColor.mainYellow().withAlphaComponent(0.5).cgColor, UIColor.colorWithRGB(249, 191, 59).withAlphaComponent(0.5).cgColor]
        testView3.layer.cornerRadius = 12
        testView3.layer.masksToBounds = true
        HOUIUtils.createGradientLayer(layer: testView3.layer, frame: testView3.frame, colors: colors3)
        
        
    }
    
}
