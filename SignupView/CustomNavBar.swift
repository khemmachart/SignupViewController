//
//  CustomNavBar.swift
//  SayHealthy
//
//  Created by KHUN NINE on 6/24/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import Foundation
import UIKit

class CustomNavBar: UINavigationController {
    
    override func viewDidLoad() {
        
        setNavBarProperties()
        setNavBarFont()
        setNavBarItems()
    }
    
    func setNavBarFont () {
        
        let titleFont = UIFont.systemFontOfSize(18)
        let titleColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().titleTextAttributes =
            [NSFontAttributeName : titleFont,
                NSForegroundColorAttributeName : titleColor]
    }
    
    func setNavBarProperties () {
        
        self.navigationBar.barStyle     = UIBarStyle.Black
        self.navigationBar.barTintColor = UIColor.greenColor()
        self.navigationBar.translucent  = false
        
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func setNavBarItems () {
        
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "popBack")
        let addButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "insertNewGroup")
        
        addButton.tintColor  = UIColor.whiteColor()
        backButton.tintColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = addButton
    }
}