//
//  TestCVCell.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/14.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit

class TestCVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.contentView.backgroundColor = .white
        
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.masksToBounds = true
        
        self.layer.cornerRadius = 16
        self.layer.shadowOffset = CGSize(width: 0, height: 20)
        self.layer.shadowColor = UIColor.black.cgColor;
        self.layer.shadowOpacity = 0.1;
        self.layer.shadowRadius = 30;
        self.layer.masksToBounds = false;
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
