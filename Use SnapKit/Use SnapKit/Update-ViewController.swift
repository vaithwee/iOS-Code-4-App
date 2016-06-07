//
//  Update-ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import SnapKit

class Update_ViewController: UIViewController {
    
    var topConstraint:Constraint?;
    var bottom:UIView?;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = UIView();
        box.backgroundColor = UIColor.redColor();
        self.view.addSubview(box);
        box.snp_makeConstraints { (make) in
            make.width.height.equalTo(100);
            make.centerX.equalTo(0);
            self.topConstraint = make.top.equalTo(self.view).offset(0).constraint;
        }
        
        self.bottom = UIView();
        self.bottom?.backgroundColor = UIColor.yellowColor();
        self.view.addSubview(self.bottom!);
        self.bottom?.snp_makeConstraints(closure: { (make) in
            make.width.height.equalTo(60);
            make.bottom.equalTo(self.view);
            make.centerX.equalTo(self.view);
        })
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func update(sender: AnyObject) {
        self.topConstraint?.updateOffset(100);
        
        self.bottom?.snp_updateConstraints(closure: { (make) in
            make.width.equalTo(200);
        })
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
