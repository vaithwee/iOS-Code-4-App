//
//  Objective-C-To-Swift-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit


class Objective_C_To_Swift_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ocview:UIView = OCView(frame: CGRectMake(0,0,100,100));
        self.view.addSubview(ocview);
        ocview.center = self.view.center;
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
