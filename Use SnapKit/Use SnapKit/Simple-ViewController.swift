//
//  Simple-ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import SnapKit

class Simple_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let box = UIView();
        box.backgroundColor = UIColor.orangeColor();
        self.view.addSubview(box);
        
        box.snp_makeConstraints { (make) in
            make.width.height.equalTo(100);
            make.center.equalTo(self.view);
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
