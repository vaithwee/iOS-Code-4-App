//
//  UIImage+QRCode.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/6.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import Foundation

extension UIImage
{
   static   func createQRForString(string:String?, imageName:String?) -> UIImage?
    {
        if let sureQRString = string
        {
            let stringData = sureQRString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false);
            let qrFilter = CIFilter(name: "CIQRCodeGenerator");
            qrFilter?.setValue(stringData, forKey: "inputMessage");
            qrFilter?.setValue("H", forKey: "inputCorrectionLevel");
            let qrCIImage = qrFilter?.outputImage;
            let colorFilter = CIFilter(name: "CIFalseColor");
            colorFilter?.setDefaults();
            colorFilter?.setValue(qrCIImage, forKey: "inputImage");
            colorFilter?.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0");
            colorFilter?.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1");
            
            let codeImage = UIImage(CIImage: (colorFilter?.outputImage!.imageByApplyingTransform(CGAffineTransformMakeScale(5, 5)))!);
            if  let iconImage = UIImage(named: imageName!)
            {
                let rect = CGRectMake(0, 0, codeImage.size.width, codeImage.size.height)
                UIGraphicsBeginImageContext(rect.size)
                
                codeImage.drawInRect(rect)
                let avatarSize = CGSizeMake(rect.size.width * 0.25, rect.size.height * 0.25)
                let x = (rect.width - avatarSize.width) * 0.5
                let y = (rect.height - avatarSize.height) * 0.5
                iconImage.drawInRect(CGRectMake(x, y, avatarSize.width, avatarSize.height))
                let resultImage = UIGraphicsGetImageFromCurrentImageContext()
                
                UIGraphicsEndImageContext()
                return resultImage
            }
            return codeImage
        }
        return nil;
    }
    
}