//
//  Double-ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import SnapKit

class Double_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let out = UIView();
        out.backgroundColor = UIColor.redColor();
        self.view.addSubview(out);
        out.snp_makeConstraints { (make) in
            make.width.height.equalTo(100);
            make.center.equalTo(self.view);
        }
        
        let inv = UIView();
        inv.backgroundColor = UIColor.orangeColor();
        out.addSubview(inv);
        inv.snp_makeConstraints { (make) in
            make.width.height.equalTo(50);
            make.bottom.equalTo(0);
            make.right.equalTo(0);
        }
        
        let top = UIView();
        top.backgroundColor = UIColor.redColor();
        self.view.addSubview(top);
        top.snp_makeConstraints { (make) in
            make.left.equalTo(20);
            make.right.equalTo(-20);
            make.height.equalTo(40);
            make.top.equalTo(60);
        }
        
        let bottom = UIView();
        bottom.backgroundColor = UIColor.yellowColor();
        self.view.addSubview(bottom);
        bottom.snp_makeConstraints { (make) in
            make.width.height.equalTo(top);
            make.left.equalTo(top);
            make.top.equalTo(top.snp_bottom);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
