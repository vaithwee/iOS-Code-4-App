//
//  DeviceDirection-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class DeviceDirection_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DeviceDirection_ViewController.recivedRotarion), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    func recivedRotarion()
    {
        let device = UIDevice.currentDevice();
        switch device.orientation
        {
        case .Portrait:
            label.text = "面向设备保持垂直，Home键位于下部"
        case .PortraitUpsideDown:
            label.text = "面向设备保持垂直，Home键位于上部"
        case .LandscapeLeft:
            label.text = "面向设备保持水平，Home键位于左侧"
        case .LandscapeRight:
            label.text = "面向设备保持水平，Home键位于右侧"
        case .FaceUp:
            label.text = "设备平放，Home键朝上"
        case .FaceDown:
            label.text = "设备平放，Home键朝下"
        case .Unknown:
            label.text = "方向未知"
        default:
            label.text = "方向未知"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var label: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
