//
//  ViewController.swift
//  sayhealthy
//
//  Created by KHUN NINE on 5/26/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import UIKit

@objc protocol SignupViewControllerDelegate {
    
    func UITextFieldGenerator () -> UITextField
    func moveForwardCondition () -> Bool
    func signupViewShouldProcess ()
}

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    let elementFrameWidth:  CGFloat = 280.0
    let elementFrameHeight: CGFloat = 45
    let cornerRadius: CGFloat       = 6.0
    
    var frameWidth:  CGFloat!
    var frameHeight: CGFloat!
    
    var viewNo:      Int!
    
    var textField :  UIView!

    var topicString = ""
    var descString  = ""
    var placeholder = ""
    var initText    = ""
    
    override func viewWillAppear(animated: Bool) {
        shouldEnableForwardButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frameWidth  = view.frame.width
        frameHeight = view.frame.height
        
        setViewProperties()
        setNavigationItems()
        setObserver()
        
        makingSignupForm()
    }
    
    func setViewProperties () {
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
    }
    
    func makingSignupForm () {
        
        let topicLabel  = UILabelGenerator(name: topicString, isDesc: false, yCenterPosition: frameHeight/2 - 130)
        let descLabel   = UILabelGenerator(name: descString,  isDesc: true,  yCenterPosition: frameHeight/2 - 30)
        
        textField       = UITextFieldGenerator()
        
        self.view.addSubview( topicLabel )
        self.view.addSubview( descLabel )
        self.view.addSubview( textField )
    }
    
    func backwardButtonPressed (sender: AnyObject) {
        // It should be dissabled for while between processing
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationItem.rightBarButtonItem?.enabled = !moveBackward()
    }
    
    func forwardButtonPressed (sender: AnyObject) {
        // It should be dissabled for while between processing
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationItem.rightBarButtonItem?.enabled = !moveForward()
    }
    
    func moveBackward () -> Bool {
        
        self.view.endEditing(true)
        
        if (viewNo == 0) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        return true
    }
    
    func moveForward () -> Bool {
        
        self.view.endEditing(true)
        let views = SignupDataController.sharedInstance.signupViewControllers
        
        // Do something before moving to the next view
        signupViewShouldProcess ()
        
        // Dismiss if this is the last view
        if (viewNo == views.count - 1) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        // Otherwise, move to the next views
        else {
            self.navigationController?.pushViewController(views[viewNo+1], animated: true)
        }
        
        return true
    }
    
    func signupViewShouldProcess () {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= self.view.frame.height * 0.19
    }
    
    func keyboardWillHide(sหender: NSNotification) {
        self.view.frame.origin.y += self.view.frame.height * 0.19
    }
    
    func textFieldTextChanged (sender: NSNotification) {
        shouldEnableForwardButton()
    }

    func shouldEnableForwardButton () {
        self.navigationItem.rightBarButtonItem?.enabled = moveForwardCondition()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        println("should return")
        if (moveForwardCondition()) {
            moveForward()
        }
        return false
    }
    
    func moveForwardCondition () -> Bool {
        
        return true
    }
    
    // MARK: - Setter methods
    
    func setObserver () {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textFieldTextChanged:"), name:UITextFieldTextDidChangeNotification, object: nil)
    }
    
    func UILabelGenerator (#name: String, isDesc: Bool, yCenterPosition: CGFloat) -> UILabel {
        
        let temp = UILabel(frame: CGRectMake(0, 0, elementFrameWidth, elementFrameHeight))
        temp.text = name
        temp.numberOfLines = 10
        temp.lineBreakMode = NSLineBreakMode.ByClipping
        temp.textAlignment = NSTextAlignment.Center
        temp.center.x = view.center.x
        temp.center.y = yCenterPosition
        
        if (isDesc) {
            temp.font = UIFont.systemFontOfSize(13)
            temp.textColor = UIColor.grayColor()
        } else {
            temp.font = UIFont.systemFontOfSize(25)
        }
        
        return temp
    }
    
    func UITextFieldGenerator () -> UITextField {
        
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
    
    func setNavigationItems () {
        
        let nextBtn = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "forwardButtonPressed:")
        let backBtn = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "backwardButtonPressed:")
        
        nextBtn.tintColor = UIColor.whiteColor()
        backBtn.tintColor = UIColor.whiteColor()
        
        self.navigationItem.rightBarButtonItem?.enabled = false
        self.navigationItem.leftBarButtonItem?.enabled  = true
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.navigationItem.rightBarButtonItem = nextBtn
    }
}

