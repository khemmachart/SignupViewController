//
//  AppProperties.swift
//  SayHealthy
//
//  Created by KHUN NINE on 6/23/15.
//  Copyright (c) 2015 KHUN NINE. All rights reserved.
//

import Foundation
import UIKit

// for more color please visit
// https://www.pinterest.com/pin/396527942168694184/

// MARK: - Enumeric

enum Screen {
    
    enum iPhone4S: CGFloat {
        case Height = 480
        case Width  = 320
    }
    
    enum iPhone5: CGFloat {
        case Height = 568
        case Width  = 320
    }
    
    enum iPhone6: CGFloat {
        case Height = 667
        case Width  = 375
    }
    
    enum iPhone6Plus: CGFloat {
        case Height = 736
        case Width  = 414
    }
}

extension UIColor {
    
    // Teal tone color
    
    class func appTealColor () -> UIColor {
        return UIColor(red: 0.15, green: 0.74, blue: 0.76, alpha: 1)
    }
    
    class func appDarkTealColor () -> UIColor {
        return UIColor(red: 2/255, green: 133/255, blue: 131/255, alpha: 1)
    }
    
    // Grayscale tone
    
    class func appWhiteColor () -> UIColor {
        return UIColor.whiteColor()
    }
    
    class func appExtraLightGrayColor () -> UIColor {
        return UIColor(white: 0.985, alpha: 1)
    }
    
    class func appLightGrayColor () -> UIColor {
        return UIColor(white: 0.85, alpha: 1)
    }
    
    class func appGrayColor () -> UIColor {
        return UIColor.lightGrayColor()
    }
    
    class func appDarkGrayColor () -> UIColor {
        return UIColor.grayColor()
    }
    
    class func appLightBlackColor () -> UIColor {
        return UIColor(red: 0.396, green: 0.427, blue: 0.471, alpha: 1)
    }
    
    class func appBlackColor () -> UIColor {
        return UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
    }
}

enum FontSize: CGFloat {
    case percentLabel  = 27
    case header        = 21
    case standard      = 18
    case description   = 16
    case content       = 14
    case percentSymbol = 12
    case profileLabel  = 11
}

// MARK: - Extension

extension UIFont {
    
    class func getTitleFont () -> UIFont {
        return UIFont(name: "SukhumvitSet-SemiBold", size: FontSize.standard.rawValue)!
    }
    
    class func getStandardFont () -> UIFont {
        return UIFont(name: "SukhumvitSet-Medium",   size: FontSize.standard.rawValue)!
    }
    
    class func getDescriptionFont () -> UIFont {
        return UIFont(name: "SukhumvitSet-Medium",   size: FontSize.description.rawValue)!
    }
    
    class func getPercentFont (#dynamic: Bool) -> UIFont {
        
        if (dynamic) {
            
            let multiplier = UIViewController().getDynamicMultiplier()
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.percentLabel.rawValue * multiplier)!
        }
        else {
            
            return UIFont(name: "SukhumvitSet-Medium",   size: FontSize.percentLabel.rawValue)!
        }
    }
    
    class func getHeaderFont (#dynamic: Bool) -> UIFont {
        
        if (dynamic) {
            
            let multiplier = UIViewController().getDynamicMultiplier()
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.header.rawValue * multiplier)!
        }
        else {
            
            return UIFont(name: "SukhumvitSet-Medium",   size: FontSize.header.rawValue)!
        }
    }
    
    class func getContentFont (#dynamic: Bool) -> UIFont {
        
        if (dynamic) {
            
            let multiplier = UIViewController().getDynamicMultiplier()
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.content.rawValue * multiplier)!
        }
        else {
            
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.content.rawValue)!
        }
    }
    
    class func getProfileLabelFont (#dynamic: Bool) -> UIFont {
        
        if (dynamic) {
            
            let multiplier = UIViewController().getDynamicMultiplier()
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.profileLabel.rawValue * multiplier)!
        }
        else {
            
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.profileLabel.rawValue)!
        }
    }
    
    class func getCircularInfographicFont (#dynamic: Bool) -> UIFont {
        
        if (dynamic) {
            
            let multiplier = UIViewController().getDynamicMultiplier()
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.percentSymbol.rawValue * multiplier)!
        }
        else {
            
            return UIFont(name: "SukhumvitSet-Medium", size: FontSize.percentSymbol.rawValue)!
        }
    }
}

extension UIViewController {
    
    func getScreenWidth () -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    func getScreenHeight () -> CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
    
    func getDynamicMultiplier () -> CGFloat {
        let screenWidth  = getScreenWidth()
        let iPhone4Width = Screen.iPhone4S.Width.rawValue
        let multiplier   = screenWidth / iPhone4Width
        
        return multiplier
    }
    
    class func getCurrentTimestamp () -> String {
        
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .LongStyle, timeStyle: .LongStyle)
        
        return timestamp
    }
    
    private class func getCalendarComponent () -> NSDateComponents {
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: date)
        
        return components
    }
    
    class func getCurrentDay () -> Int {
        
        let components = getCalendarComponent()
        return components.day
    }
    
    class func getCurrentMonth () -> Int {
        let components = getCalendarComponent()
        return components.month
    }
    
    class func getCurrentYear () -> Int {
        let components = UIViewController.getCalendarComponent()
        return components.year
    }
    
    class func getCurrentMonthName () -> String {
        
        let monthNumber = getCurrentMonth()
        
        switch monthNumber {
        case 1:
            return "มกราคม"
        case 2:
            return "กุมภาพันธ์"
        case 3:
            return "มีนาคม"
        case 4:
            return "เมษายน"
        case 5:
            return "พฤษภาคม"
        case 6:
            return "มิถุนายน"
        case 7:
            return "กรกฏาคม"
        case 8:
            return "สิงหาคม"
        case 9:
            return "กันยายน"
        case 10:
            return "ตุลาคม"
        case 11:
            return "พฤษจิกายน"
        case 12:
            return "ธันวาคม"
        default:
            return "เดือน \(monthNumber)"
        }
    }
    
    // Get the size of current device
    func iPhoneScreenSize () -> String {
        
        var result: CGSize = UIScreen.mainScreen().bounds.size
        
        if(result.height == 480) {
            return "3.5"
        }
        else if(result.height == 568) {
            return "4.0"
        }
        else if(result.height == 667) {
            return "4.7"
        }
        else if(result.height == 736) {
            return "5.5"
        }
        else {
            return ""
        }
    }
    
    func add (#subviews: [UIView], view: UIView) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func getRootViewController () -> UIViewController {
        
        return UIView().getRootViewController()
    }
    
    func getTopViewController () -> UIViewController {
        
        return UIView().getTopViewController()
    }
    
    func getFirstWindow () -> UIWindow {
        
        return UIView().getFirstWindow()
    }
}

extension UIView {
    
    func getRootViewController () -> UIViewController {
        
        let appDelegate    = UIApplication.sharedApplication().delegate as! AppDelegate
        let viewController = appDelegate.window!.rootViewController
        
        return viewController!
    }
    
    func getTopViewController () -> UIViewController {
        
        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        // Return root view controller instead if the top view doesn't exist
        return getRootViewController()
    }
    
    func getFirstWindow () -> UIWindow {
        
        let window = UIApplication.sharedApplication().windows.first as! UIWindow
        
        return window
    }
}
