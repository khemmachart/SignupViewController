//
//  SignupDataController.swift
//  SignupView
//
//  Created by KHUN NINE on 8/25/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import Foundation
import UIKit

class SignupDataController: NSObject {
    
    static let sharedInstance = SignupDataController()
    
    var signupViewControllers: [SignupViewController]!
    
    func getStarted () {
        
        if (signupViewControllers == nil) {
            singupViewControllersMake ()
        }
        
        let navigationController = CustomNavBar(rootViewController: signupViewControllers[0])
        let topViewContorller = UIViewController.getTopViewController()

        topViewContorller.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func singupViewControllersMake () {
        
        // Initialze
        signupViewControllers = [SignupViewController]()
        
        // 1
        let productName = SignupNameViewController()
        productName.title       = "ชื่อของผลิตภัณฑ์"
        productName.topicString = "ชื่อของผลิตภัณฑ์"
        productName.descString  = "ระบุข้อมูลให้ครบ (ตราสินค้า ชื่อสินค้า รสชาติ) เช่น\nJACK' n JILL ฟันโอ คุกกี้แซนวิช สอดไส้ครีมช็อกโกแลต"
        productName.placeholder = "ตราสินค้า ชื่อสินค้า รสชาติ"
        productName.initText    = "test"
        productName.viewNo      = 0
        
        signupViewControllers.append(productName)
        
        let productName2 = SignupNameViewController()
        productName2.title       = "ชื่อของผู้ใช้123123"
        productName2.topicString = "ชื่อของผู้ใช้"
        productName2.descString  = "ไม่จำเป็นต้องระบุกหกด sdjhskjhjklfgdhdfgh \nieuwrtiowehrkjgfjbx,cvb sfh dfh"
        productName2.placeholder = "ตราสินค้า ชื่อสินค้า รสชาติ"
        productName2.initText    = "test"
        productName2.viewNo      = 1
        
        signupViewControllers.append(productName2)
        
        let productName3 = SignupNameViewController()
        productName3.title       = "หกดฟหกดหกดใช้"
        productName3.topicString = "ชื่อasdfasdfsdผู้ใช้"
        productName3.descString  = "ไม่จำเป็นต้องระบุกหกด sdjhskjhjklfgdhdfgh \nieuwrtiowehrkjgfjbx,cvb sfh dfh"
        productName3.placeholder = "ตราสินค้า ชื่อสินค้า รสชาติ"
        productName3.initText    = "test"
        productName3.viewNo      = 2
        
        signupViewControllers.append(productName3)
    }
}