//
//  UINavigationBar-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/27.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UINavigationBar_ViewController: UIViewController {

    
    var count = 0;
    var navigationBar:UINavigationBar!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar = self.navigationController?.navigationBar;
        
        let leftBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add");
        self.navigationItem.setLeftBarButtonItem(leftBtn, animated: true);
        
        let right = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancel");
        self.navigationItem.rightBarButtonItem = right;
        
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
