//
//  ChallengeMainVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class ChallengeMainVC: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var scrollView: UIScrollView!
    var collectionView: UICollectionView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let visibleHeight = UIScreen.main.bounds.size.height - 4
    let cellWidth = UIScreen.main.bounds.size.width - 40
    let cellHeight: CGFloat = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        
        /* ScrollView */
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: visibleHeight))
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
        
        /* CollectionView */
        //Layout
        let layout = UICollectionViewFlowLayout()
        // 设置尺寸
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        // 竖直滚动
        layout.scrollDirection = .vertical
        // 设置额外滚动区域
        layout.sectionInset = UIEdgeInsets(top: 40, left: 80, bottom: 40, right: 80)
        // 设置cell间距
        // 设置水平间距
        layout.minimumInteritemSpacing = 40
        // 设置垂直间距
        layout.minimumLineSpacing = 40
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: visibleHeight), collectionViewLayout: layout)
        scrollView.addSubview(collectionView)
        collectionView.register(TestCVCell.self, forCellWithReuseIdentifier: "testCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        return cell
    }
    
}
