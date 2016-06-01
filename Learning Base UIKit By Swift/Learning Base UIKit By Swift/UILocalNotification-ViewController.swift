//
//  UILocalNotification-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/30.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UILocalNotification_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushLocalNotication(sender: AnyObject) {
        self.cancelLocalNotification(123123);
        
        let localnotification = UILocalNotification();
        localnotification.fireDate = NSDate(timeIntervalSinceNow: 30);
        localnotification.timeZone = NSTimeZone.defaultTimeZone();
        localnotification.alertBody = "来着Wee的本地消息";
        localnotification.soundName = UILocalNotificationDefaultSoundName;
        localnotification.userInfo = ["ItemId":123123];
        UIApplication.sharedApplication().scheduleLocalNotification(localnotification);
        
    }
    
    func cancelLocalNotification(itemId:Int) {
        let existingNotification = self.notificationForThisItem(itemId) as UILocalNotification?;
        if existingNotification != nil
        {
            UIApplication.sharedApplication().cancelLocalNotification(existingNotification!);
        }
    }
    
    func notificationForThisItem(itemId:Int) -> UILocalNotification?
    {
        let allNotification = UIApplication.sharedApplication().scheduledLocalNotifications;
        for notification in allNotification!
        {
            let info = notification.userInfo as! [String:Int];
            let number = info["ItemId"];
            if number != nil && number == itemId {
                return notification as UILocalNotification;
            }
        }
        return nil;
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
