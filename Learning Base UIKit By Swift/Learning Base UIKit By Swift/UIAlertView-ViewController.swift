//
//  UIAlertView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/5/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIAlertView_ViewController: UIViewController, UIAlertViewDelegate {

    var alertView = UIAlertView();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UIAlertView"
        
        alertView.title = "系统登录";
        alertView.message = "请输入用户名和密码";
        alertView.addButtonWithTitle("取消");
        alertView.addButtonWithTitle("确定");
        alertView.cancelButtonIndex = 0;
        alertView.delegate = self;
        alertView.alertViewStyle = .Default;
        alertView.show();
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.cancelButtonIndex == buttonIndex {
            print("点击了取消");
        }
        else
        {
            let name = alertView.textFieldAtIndex(0);
            let password = alertView.textFieldAtIndex(1);
            print("用户名是\(name?.text) 密码是\(password?.text)");
            
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
