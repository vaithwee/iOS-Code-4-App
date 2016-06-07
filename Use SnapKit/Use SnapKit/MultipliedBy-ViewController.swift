//
//  MultipliedBy-ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import SnapKit

class MultipliedBy_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let outter = UIView();
        outter.backgroundColor = UIColor.redColor();
        self.view.addSubview(outter);
        outter.snp_makeConstraints { (make) in
            make.width.height.equalTo(200);
            make.center.equalTo(0);
        }
        
        let inner = UIView();
        inner.backgroundColor = UIColor.yellowColor();
        self.view.addSubview(inner);
        inner.snp_makeConstraints { (make) in
            make.center.equalTo(0);
            make.size.equalTo(outter).multipliedBy(0.5);
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
