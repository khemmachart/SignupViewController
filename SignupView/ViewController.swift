//
//  ViewController.swift
//  SignupView
//
//  Created by KHUN NINE on 8/24/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        
        SignupDataController.sharedInstance.getStarted()
        
        // Just test
    }
}

extension UIViewController {
    
    class func getTopViewController () -> UIViewController {
        
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        // Return root view controller instead if the top view doesn't exist
        return UIViewController()
    }
}

