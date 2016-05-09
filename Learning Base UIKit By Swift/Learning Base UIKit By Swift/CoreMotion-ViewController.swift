//
//  CoreMotion-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotion_ViewController: UIViewController {

    var ball:UIImageView!;
    var speedX:UIAccelerationValue = 0;
    var speedY:UIAccelerationValue = 0;
    var motionManager = CMMotionManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = UIImageView(image: UIImage(named: "ball"));
        ball.center = self.view.center;
        self.view.addSubview(ball);
        
        motionManager.accelerometerUpdateInterval = 1/60;
        
        if motionManager.accelerometerAvailable
        {
            let queue = NSOperationQueue.currentQueue();
            motionManager.startAccelerometerUpdatesToQueue(queue!, withHandler: { (accelerometerData, error) -> Void in
                
                self.speedX += (accelerometerData?.acceleration.x)!;
                self.speedY += (accelerometerData?.acceleration.y)!;
                
                var posX = self.ball.center.x + CGFloat(self.speedX);
                var poxY = self.ball.center.y - CGFloat(self.speedY);
                if posX < 0
                {
                    posX = 0;
                    self.speedX *= -0.4;
                }
                else if posX > self.view.frame.size.width
                {
                    posX = self.view.frame.size.width;
                    self.speedX *= -0.4;
                }
                
                if poxY < 64
                {
                    poxY = 64;
                    self.speedY = 0;
                }
                else if poxY > self.view.bounds.size.height
                {
                    poxY = self.view.bounds.size.height;
                    self.speedY *= -0.4;
                }
                
                self.ball.center = CGPointMake(posX, poxY);
                
            })
        
        }

        // Do any additional setup after loading the view.
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
