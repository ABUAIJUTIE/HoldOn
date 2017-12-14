//
//  EventMainVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit

class EventMainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let visibleHeight = UIScreen.main.bounds.size.height - 49
    let cellWidth = UIScreen.main.bounds.size.width - 40
    let cellHeight: CGFloat = 440
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        
        /* CollectionView */
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 40, right: 20)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 40
        layout.headerReferenceSize = CGSize(width: screenWidth, height: 96)
        // CollectionView 本体
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: visibleHeight), collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(TestCVCell.self, forCellWithReuseIdentifier: "testCell")
        collectionView.register(TestHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "testHeader")
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "testHeader", for: indexPath) as! TestHeader
        header.setTitleAndTime(titleText: "动态", timeText: "12月14日 星期四")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if (cell != nil) {
            UIView.animate(withDuration: 0.15, animations: {
                cell?.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
            }, completion: { (finished: Bool) -> Void in
                UIView.animate(withDuration: 0.15, animations: {
                    cell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: { (finished: Bool) -> Void in
                    
                })
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
