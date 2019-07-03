//
//  ViewController.swift
//  HLImagePositionButton
//
//  Created by  xueguoxue on 2019/7/3.
//  Copyright © 2019 lhkzhl. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testButton()
    }

    func testButton() {
        let buttons = [HLImagePositionButton(type: .left),
                       HLImagePositionButton(type: .left),
                       HLImagePositionButton(type: .left),
                       HLImagePositionButton(type: .right),
                       HLImagePositionButton(type: .right),
                       HLImagePositionButton(type: .right),
                       HLImagePositionButton(type: .top),
                       HLImagePositionButton(type: .top),
                       HLImagePositionButton(type: .top),
                       HLImagePositionButton(type: .bottom),
                       HLImagePositionButton(type: .bottom),
                       HLImagePositionButton(type: .bottom),
                       UIButton(type: .custom),
                       UIButton(type: .custom),
                       UIButton(type: .custom),]
        
        buttons.enumerated().forEach { (offset,button) in
            let left = offset % 3
            if left == 0 {
                //                button.setImage(UIImage(named: "pig"), for: .normal)
                button.setBackgroundImage(UIImage(named: "pig"), for: .normal)
            }
            if left == 2 {
                button.setTitle("abc\nsaf", for: .normal)
                button.titleLabel?.numberOfLines = 0
            }
            if left == 1 {
                //                button.setTitle("abc", for: .selected)
                button.setTitle("abc\nsafd", for: .normal)
                button.titleLabel?.numberOfLines = 0
                button.titleLabel?.textAlignment  = .center
                
                button.setImage(UIImage(named: "pig"), for: .normal)
                button.setBackgroundImage(UIImage(named: "pig"), for: .normal)
                
                
                button.isSelected = true
            }
            
            button.backgroundColor = UIColor.cyan
            button.imageView?.backgroundColor = UIColor.lightGray
            button.titleLabel?.backgroundColor = UIColor.red
            view.addSubview(button)
            button.snp.makeConstraints { (make) in
//                make.left.top.equalTo(10)
                make.left.equalTo(375.0/3*CGFloat(left) + 10)
                make.top.equalTo(667/6*(CGFloat(offset/3) + 1))
                
            }
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
}

