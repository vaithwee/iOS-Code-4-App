//
//  UIImage+CGBlendMode.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import Foundation

extension UIImage
{
    func tint(color:UIColor, blendMode:CGBlendMode) -> UIImage
    {
        let rect = CGRectMake(0, 0, self.size.width, self.size.height);
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale);
        color.setFill();
        UIRectFill(rect);
        drawInRect(rect, blendMode: blendMode, alpha: 1.0);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}