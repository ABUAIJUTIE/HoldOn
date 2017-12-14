//
//  HOBaseView.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import SnapKit

class HOBaseView: UIView {

    var title: UILabel!
    var moreBtn: UIButton!
//    var line: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //背景
        backgroundColor = UIColor.white
        //标题
        title = UILabel()
        addSubview(title)
        //右侧按钮
        
        //分割线
//        line = UIView()
//        line.backgroundColor = .backgroundGary()
//        addSubview(line)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //标题
        title.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(16)
        }
        //右侧按钮
        
        //分割线
//        line.snp.makeConstraints { (make) -> Void in
//            make.width.equalTo(self)
//            make.height.equalTo(1)
//            make.left.bottom.equalTo(self)
//        }
    }
    
    func setup(titleText: String) {
        //标题
        title.text = titleText
        title.textColor = .dark()
        title.font = .systemFont(ofSize: 14, weight: .regular)
        title.sizeToFit()
    }
    
    func setup(titleText: String, withButton: Bool) {
        //标题
        title.text = titleText
        title.textColor = .dark()
        title.font = .systemFont(ofSize: 14, weight: .regular)
        title.sizeToFit()
        //右侧按钮
        if withButton {
            moreBtn = UIButton()
            addSubview(moreBtn)
            moreBtn.snp.makeConstraints { (make) -> Void in
                make.width.height.equalTo(14)
                make.centerY.equalTo(self)
                make.right.equalTo(self).offset(-16)
            }
            moreBtn.setImage(#imageLiteral(resourceName: "base_view_more_button"), for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
