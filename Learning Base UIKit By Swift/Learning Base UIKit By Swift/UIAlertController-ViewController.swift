//
//  UIAlertController-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIAlertController_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertControl = UIAlertController(title: "系统提示", message: "你确定要开启手机七彩跑马灯模式么", preferredStyle: .Alert);
        let cancelAction = UIAlertAction(title: "取消", style: .Destructive, handler: nil);
        let okAction = UIAlertAction(title: "确定", style: .Default) { (action) -> Void in
            print("点击了确定\(arc4random_uniform(5))");
            
            
            let alert = UIAlertController(title: "七彩跑马灯", message: "请选择七彩跑马灯的模式", preferredStyle: .ActionSheet);
            let singleAction = UIAlertAction(title: "七彩祥云", style: .Default, handler: nil);
            let doubleAction = UIAlertAction(title: "七色彩虹", style: .Destructive, handler: nil);
            let canAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil);
            alert.addAction(singleAction);
            alert.addAction(doubleAction);
            alert.addAction(canAction);
            self.presentViewController(alert, animated: true, completion: nil);
        }
        alertControl.addAction(cancelAction);
        alertControl.addAction(okAction);
        self.presentViewController(alertControl, animated: true, completion: nil);
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
