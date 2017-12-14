//
//  MeMainVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit

class MeMainVC: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let visiableHeight = UIScreen.main.bounds.size.height - 20

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        
        /* ScrollView */
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.height.equalTo(visiableHeight)
            make.top.equalTo(view).offset(20)
            make.left.equalTo(view)
        }
        scrollView.backgroundColor = UIColor.backgroundGary()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        //        scrollView.bounces = true
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        
        /* 我 - 标题 */
        let titleView = UIView()
        titleView.backgroundColor = .white
        scrollView.addSubview(titleView)
        titleView.snp.makeConstraints { (make) -> Void in
            make.top.left.equalTo(scrollView)
            make.width.equalTo(screenWidth)
            make.height.equalTo(96)
        }
        let title = UILabel()
        titleView.addSubview(title)
        title.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(titleView).offset(24)
            make.bottom.equalTo(titleView).offset(-8)
        }
        title.text = "我"
        title.textColor = .dark()
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        title.sizeToFit()
        
    }

}
