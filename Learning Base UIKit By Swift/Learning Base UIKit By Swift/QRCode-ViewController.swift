//
//  QRCode-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/6.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class QRCode_ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage.createQRForString("http://www.baidu.com", imageName: "swift");
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(QRCode_ViewController.readQRCode));
        self.view.addGestureRecognizer(longPress);
        // Do any additional setup after loading the view.
    }
    
    //需要真机
    func readQRCode()
    {
        let ciImage:CIImage=CIImage(image:UIImage.createQRForString("http://www.baidu.com", imageName: "swift")!)!
        let context = CIContext(options: nil)
        let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode,
                                           context: context, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        
        let features=detector.featuresInImage(ciImage)
        
        print("扫描到二维码个数：\(features.count)")
        //遍历所有的二维码，并框出
        for feature in features as! [CIQRCodeFeature] {
            print(feature.messageString)
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
