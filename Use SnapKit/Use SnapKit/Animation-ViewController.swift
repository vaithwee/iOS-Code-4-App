//
//  Animation-ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class Animation_ViewController: UIViewController {

    var box:UIView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        let box = UIView();
        box.backgroundColor = UIColor.redColor();
        self.view.addSubview(box);
        box.snp_updateConstraints { (make) in
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
            make.size.equalTo(CGSizeMake(100, 100));
        }
        self.box = box;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func animation(sender: AnyObject) {

        UIView.animateWithDuration(5) {
            self.box.snp_updateConstraints { (make) in
                make.centerY.equalTo(self.view).offset(100);
            }
            self.view.layoutIfNeeded();
        }
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
