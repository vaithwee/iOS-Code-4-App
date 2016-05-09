//
//  UIDatePickerCountDown-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIDatePickerCountDown_ViewController: UIViewController {

    var cTimer:UIDatePicker!;
    var btnStart:UIButton!;
    
    var leftTime:Int = 180;
    var alertView:UIAlertView!;
    
    var timer:NSTimer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cTimer = UIDatePicker(frame: CGRectMake(0, 120, 200, 200));
        cTimer.datePickerMode = .CountDownTimer;
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
          self.cTimer.countDownDuration = NSTimeInterval(self.leftTime);
        }
        
        cTimer.addTarget(self, action: Selector("timerChanged"), forControlEvents: .ValueChanged);
        self.view.addSubview(cTimer);
        
        btnStart = UIButton(type: .System);
        btnStart.frame = CGRectMake(100, 400, 100, 100);
        btnStart.setTitleColor(UIColor.redColor(), forState: .Normal);
        btnStart.setTitleColor(UIColor.greenColor(), forState: .Disabled);
        btnStart.setTitle("开始", forState: .Normal);
        btnStart.setTitle("倒计时中", forState: .Disabled);
        btnStart.addTarget(self, action: Selector("startClick"), forControlEvents: .TouchUpInside);
        self.view.addSubview(btnStart);
    }
    
    func timerChanged()
    {
        print("您选择倒计时时间为：\(cTimer.countDownDuration)");
    }
    
    func startClick()
    {
        btnStart.enabled = true;
        
        leftTime = Int(cTimer.countDownDuration);
        self.cTimer.enabled = true;
        
        alertView = UIAlertView();
        alertView.title = "倒计时开始";
        alertView.message = "倒计时开始，还有\(leftTime)秒...";
        alertView.addButtonWithTitle("确定");
        alertView.show();
        
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1), target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true);
        //NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode);
    }
    
    func updateTime()
    {
        alertView.message = "倒计时开始，还有\(leftTime)秒...";
        leftTime -= 1;
        cTimer.countDownDuration = NSTimeInterval(leftTime);
        if leftTime <= 0
        {
            timer.invalidate();
            cTimer.enabled = true;
            btnStart.enabled = true;
            alertView.message = "时间到";
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
