
//
//  UISwitch+Label.swift
//  SwitchWithLabel
//
//  Created by CIA on 2017/11/16.
//  Copyright © 2017年 CIA. All rights reserved.
//

import UIKit
private var AssociatedObjectHandleLeftKey: UInt8 = 0
private var AssociatedObjectHandleRightKey: UInt8 = 1

extension UISwitch{
    func addTextsInSwitch(_ switchText:[String], textColor:UIColor? = nil,textFont:UIFont = UIFont.systemFont(ofSize: 13)) {
        var leftString = ""
        var rightString = ""
        if switchText.count > 0{
            leftString = switchText[0]
        }
        if switchText.count > 1{
            rightString = switchText[1]
        }
        objc_setAssociatedObject(self, &AssociatedObjectHandleLeftKey, leftString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &AssociatedObjectHandleRightKey, rightString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        var textLabel:UILabel! = viewWithTag(77) as? UILabel
        if textLabel == nil{
            textLabel = UILabel()
            textLabel.tag = 77
            addSubview(textLabel)
        }
        textLabel.font = textFont
        if let color = textColor{
            textLabel.textColor = color
        }
        reCheckLabel()
        addTarget(self, action: #selector(self.touchUpProcess), for: .touchUpInside)
    }
    
    @objc func touchUpProcess() {
        reCheckLabel()
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let textLabel = viewWithTag(77) as? UILabel{
            textLabel.isHidden = true
        }
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let textLabel = viewWithTag(77) as? UILabel{
            textLabel.isHidden = false
            reCheckLabel()
        }
    }
    
    func reCheckLabel() {
        if let textLabel = viewWithTag(77) as? UILabel{
            let leftString = objc_getAssociatedObject(self, &AssociatedObjectHandleLeftKey) as? String
            let rightString = objc_getAssociatedObject(self, &AssociatedObjectHandleRightKey) as? String
            if isOn{
                textLabel.text = leftString
            } else {
                textLabel.text = rightString
            }
            textLabel.sizeToFit()
            if isOn{
                textLabel.center = CGPoint(x: frame.size.width * 0.25, y: frame.size.height/2)
            } else {
                textLabel.center = CGPoint(x: frame.size.width * 0.75, y: frame.size.height/2)
            }
        }
    }
}
