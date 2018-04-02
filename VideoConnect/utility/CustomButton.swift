//
//  CustomButton.swift
//  VideoConnect
//
//  Created by Protocol on 2/17/17.
//  Copyright © 2017 VideoConn. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    @IBInspectable var arrangeTitle: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if arrangeTitle == true {
//            let kTextTopPadding:CGFloat = 0
//            var titleLabelFrame = self.titleLabel!.frame
//            let labelSize = titleLabel!.sizeThatFits(CGSizeMake(CGRectGetWidth(self.contentRectForBounds(self.bounds)), CGFloat.max))
//            var imageFrame = self.imageView!.frame
//            let fitBoxSize = CGSizeMake(max(imageFrame.size.width, labelSize.width), labelSize.height + kTextTopPadding + imageFrame.size.height)
//            let fitBoxRect = CGRectInset(self.bounds, (self.bounds.size.width - fitBoxSize.width)/2, (self.bounds.size.height - fitBoxSize.height)/2)
//            
//            imageFrame.origin.y = fitBoxRect.origin.y
//            imageFrame.origin.x = CGRectGetMidX(fitBoxRect) - (imageFrame.size.width/2)
//            self.imageView!.frame = imageFrame;
//            
//            titleLabelFrame.size.width = self.bounds.size.width
//            titleLabelFrame.size.height = labelSize.height
//            titleLabelFrame.origin.x = 0
//            titleLabelFrame.origin.y = fitBoxRect.origin.y + imageFrame.size.height + kTextTopPadding
//            self.titleLabel!.frame = titleLabelFrame
//            self.titleLabel!.textAlignment = NSTextAlignment.Center
//        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
