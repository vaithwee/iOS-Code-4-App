//
//  UIColor+RGB.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import Foundation

extension UIColor
{
    static  func colorWithRGB(rgb:uint) -> UIColor
    {
        let r:uint = rgb >> 16;
        let g:uint = rgb >> 8 & 0xFF;
        let b:uint = rgb & 0xFF;
        let color = UIColor.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1);
        return color;
    }
}
