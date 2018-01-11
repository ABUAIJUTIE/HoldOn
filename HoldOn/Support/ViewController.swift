//
//  ViewController.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var pageControl: UIPageControl?
    var scrollView: UIScrollView!
    var label: UILabel!
    
    var isPageControlUsed = false
    
    var screenFrame :CGRect?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "UIPageControl"
        
        self.view.backgroundColor = UIColor.white
        screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame!.width
        let screenHeight = screenFrame!.height
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 96))
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 48))
        view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(view)
        }
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        label.textColor = .black
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 96, width: screenWidth, height: screenHeight - 96))
        pageControl = UIPageControl(frame: CGRect(x: 0, y: screenHeight - 40, width: screenWidth, height: 40))
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        //        scrollView.alwaysBounceVertical = true
        
        scrollView!.contentSize = CGSize(width: screenWidth * 3, height: screenHeight - 60)
        let firstViewController = FitPageVC()
        firstViewController.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 60)
        let secondViewController = RunningPageVC()
        secondViewController.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight - 60)
        let thirdViewController = RidingPageVC()
        thirdViewController.view.frame = CGRect(x: screenWidth * 2, y: 0, width: screenWidth, height: screenHeight - 60)
        
        scrollView!.addSubview(firstViewController.view)
        scrollView!.addSubview(secondViewController.view)
        scrollView!.addSubview(thirdViewController.view)
        
        scrollView!.delegate = self
        
        self.view.addSubview(scrollView!)
        
        pageControl!.numberOfPages = 3
        pageControl!.currentPage = 0
        pageControl!.addTarget(self, action: #selector(pageDidChanged(obj:)), for: UIControlEvents.valueChanged)
        
        self.view.addSubview(pageControl!)
        
    }
    
    @objc func pageDidChanged(obj: UIPageControl) -> Void {
        let currentPage = obj.currentPage
        var frame = scrollView!.frame
        frame.origin.x = (CGFloat)(currentPage) * frame.size.width
        
        scrollView!.scrollRectToVisible(frame, animated: true)
        isPageControlUsed = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(!isPageControlUsed) {
            let pageWidth = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
            pageControl!.currentPage = (Int)(page)
            print(page)
            switch pageControl!.currentPage {
            case 0:
                label.text = "今天"
            case 1:
                label.text = "跑步"
            case 2:
                label.text = "骑行"
            default:
                label.text = "今天"
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isPageControlUsed = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

