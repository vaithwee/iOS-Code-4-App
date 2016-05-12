//
//  UITouch_ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UITouch_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.multipleTouchEnabled = true;
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first;
        if touch?.tapCount == 2
        {
            self.view.backgroundColor = UIColor.whiteColor();
        }
        else if (touch?.tapCount == 1)
        {
            self.view.backgroundColor = UIColor.redColor();
        }
        print("event begin");
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch! = touches.first;
        print(touch.locationInView(self.view));
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 2
        {
            let first:UITouch! = touches.first;
            let second = (touches as NSSet).allObjects[1] as! UITouch
            
            let firstPoint = first.locationInView(self.view)
            let secondPoint = second.locationInView(self.view)
        
            let deltaX = secondPoint.x - firstPoint.x
            let deltaY = secondPoint.y - firstPoint.y
            let initialDistance = sqrt(deltaX*deltaX + deltaY*deltaY)
            print("两点间距离：\(initialDistance)")

            let height = secondPoint.y - firstPoint.y
            let width = firstPoint.x - secondPoint.x
            let rads = atan(height/width);
            let degrees = 180.0 * Double(rads) / M_PI
            print("两点间角度：\(degrees)")
        }
    }

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
