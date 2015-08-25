//
//  SignupNameViewController.swift
//  SignupView
//
//  Created by KHUN NINE on 8/25/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import Foundation
import UIKit

class SignupNameViewController: SignupViewController, SignupViewControllerDelegate {
    
    override func UITextFieldGenerator () -> UITextField {
        
        let textField = UITextField(frame: CGRectMake(0, 0, elementFrameWidth, elementFrameHeight))
        textField.center = CGPointMake(self.view.center.x, frameHeight/2 - 80)
        textField.font = UIFont.systemFontOfSize(15)
        textField.textColor = UIColor.grayColor()
        textField.backgroundColor = UIColor.whiteColor()
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
            attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textField.textAlignment = NSTextAlignment.Center
        textField.clearButtonMode = UITextFieldViewMode.Always
        textField.returnKeyType = UIReturnKeyType.Next
        textField.delegate = self
        textField.font = UIFont.systemFontOfSize(18)
        
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField.layer.borderWidth = 0
        
        textField.text  = initText
        
        return textField
    }
    
    override func moveForwardCondition () -> Bool {
        
        let textLength = count((textField as! UITextField).text)
        
        if ( textLength > 0) {
            return true
        }
        else {
            return false
        }
    }
    
    override func signupViewShouldProcess () {
        println(title!)
    }
}