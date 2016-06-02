//
//  MessageUI-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import MessageUI

class MessageUI_ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(sender: AnyObject) {
        if MFMessageComposeViewController.canSendText()
        {
            let control = MFMessageComposeViewController();
            control.body = "短信内容";
            control.recipients = ["12306","10086"];
            control.messageComposeDelegate = self;
            self.presentViewController(control, animated: true, completion: nil);
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResultSent.rawValue:
            print("短信已发送");
        case MessageComposeResultCancelled.rawValue:
            print("短信取消发送");
        case MessageComposeResultFailed.rawValue:
            print("发送失败");
        default:
            break;
        }
        controller.dismissViewControllerAnimated(true, completion: nil);
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
