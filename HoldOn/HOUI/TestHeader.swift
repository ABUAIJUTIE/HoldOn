//
//  TestHeader.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class TestHeader: UICollectionReusableView {
    
    var title: UILabel!
    var time: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        title = UILabel()
        title.textColor = .dark()
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        title.textAlignment = .left
        addSubview(title)
        
        time = UILabel()
        time.textColor = .lightGray
        time.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        time.textAlignment = .left
        addSubview(time)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-10)
        }
        time.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(title)
            make.bottom.equalTo(title.snp.top).offset(-8)
        }
    }
    
    func setTitleAndTime(titleText: String, timeText: String) {
        title.text = titleText
        title.sizeToFit()
        time.text = timeText
        time.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
}
