//
//  String+MD5.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import Foundation

extension String
{
    var MD5:String
    {
        let string = self.cStringUsingEncoding(NSUTF8StringEncoding);
        let lenght = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding));
        let disgesLenght = Int(CC_MD5_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(disgesLenght);
        CC_MD5(string!, lenght, result);
        let hash = NSMutableString();
        for i in 0 ..< disgesLenght {
            hash.appendFormat("%02x", result[i]);
        }
        result.destroy();
        
        return String(format: hash as String)
    }
}