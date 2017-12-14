//
//  FitnessMainVC.swift
//  HoldOn
//
//  Created by derrick·J on 2017/12/13.
//  Copyright © 2017年 Zheng Buxuan. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {

    private let viewController1 = FitPageVC()
    private let viewController2 = RunningPageVC()
    private let viewController3 = RidingPageVC()
    private let viewController4 = WalkingPageVC()
    private let viewController5 = WeatherPageVC()
    
    //组件类型
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子VC
    fileprivate var pagingControllers: [UIViewController] {
        return [viewController1, viewController2, viewController3, viewController4, viewController5]
    }
    
    //菜单配置
    fileprivate struct MenuOptions: MenuViewCustomizable {
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4(), MenuItem5()]
        }
        
        var height: CGFloat = 64
        
        var focusMode: MenuFocusMode = .underline(height: 1.6, color: .dark(), horizontalPadding: 28, verticalPadding: 0)
        
        var animationDuration: TimeInterval = 0.1
        
//        var deceleratingRate = 10
        
    }

    //菜单items
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "运动", color: .dark(), selectedColor: .dark(), font: .systemFont(ofSize: 16), selectedFont: .systemFont(ofSize: 16)))
        }
    }
    
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "跑步", color: .dark(), selectedColor: .dark(), font: .systemFont(ofSize: 16), selectedFont: .systemFont(ofSize: 16)))
        }
    }
    
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "骑行", color: .dark(), selectedColor: .dark(), font: .systemFont(ofSize: 16), selectedFont: .systemFont(ofSize: 16)))
        }
    }
    
    fileprivate struct MenuItem4: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "行走", color: .dark(), selectedColor: .dark(), font: .systemFont(ofSize: 16), selectedFont: .systemFont(ofSize: 16)))
        }
    }
    
    fileprivate struct MenuItem5: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat = 20
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "占位", color: .clear, selectedColor: .clear, font: .systemFont(ofSize: 16), selectedFont: .systemFont(ofSize: 16)))
        }
    }
}

class FitnessMainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI() {
        /* PagingMenu */
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 20
        
        //建立父子关系
        addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(pagingMenuController.view)
        
        /* 分割线 */
        let line = UIView(frame: CGRect(x: 0, y: 84, width: UIScreen.main.bounds.size.width, height: 1))
        line.backgroundColor = .backgroundGary()
        view.addSubview(line)
        
    }
    
}
