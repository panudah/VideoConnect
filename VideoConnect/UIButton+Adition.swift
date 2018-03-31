//
//  UIButton+Adition.swift
//  VideoConnect
//
//  Created by Protocol on 9/5/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation

private var currentIndexPath: NSIndexPath = NSIndexPath()
private var currentObject: NSObject = NSObject()

//extension UIButton {
//    var indexPath: NSIndexPath! {
//        get {
//            return objc_getAssociatedObject(self, &currentIndexPath) as? NSIndexPath
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &currentIndexPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//    }
//
//    var object: NSObject! {
//        get {
//            return objc_getAssociatedObject(self, &currentObject) as? NSObject
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &currentObject, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//    }
//
//    func makeUnderline(underline:Bool) {
//        let titleString : NSMutableAttributedString = NSMutableAttributedString(string: (self.titleLabel?.text)!)
//        titleString.addAttribute(NSForegroundColorAttributeName, value: (self.titleLabel?.textColor)!, range: NSMakeRange(0, (self.titleLabel?.text!.characters.count)!))
//
//        if underline {
//            titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, (self.titleLabel?.text!.characters.count)!))
//        }
//
//        self.setAttributedTitle(titleString, forState: UIControlState.Normal)
//    }
//}
//
//private var currentIndexPathGesture: NSIndexPath = NSIndexPath()
//private var currentObjectGesture: NSObject = NSObject()
//
//extension UIGestureRecognizer {
//    var indexPath: NSIndexPath! {
//        get {
//            return objc_getAssociatedObject(self, &currentIndexPathGesture) as? NSIndexPath
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &currentIndexPathGesture, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//    }
//
//    var object: NSObject! {
//        get {
//            return objc_getAssociatedObject(self, &currentObjectGesture) as? NSObject
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &currentObjectGesture, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//    }
//}

