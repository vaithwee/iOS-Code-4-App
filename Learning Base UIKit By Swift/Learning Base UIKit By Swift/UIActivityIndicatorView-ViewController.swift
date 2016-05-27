//
//  UIActivityIndicatorView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/27.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIActivityIndicatorView_ViewController: UIViewController {

    var activityIndicator:UIActivityIndicatorView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray);
        activityIndicator.center = self.view.center;
        self.view.addSubview(activityIndicator);
       
        play();
        
        let button = UIButton(type: .Custom);
        button .setTitle("Stop", forState: .Normal);
        button.addTarget(self, action: #selector(UIActivityIndicatorView_ViewController.stop), forControlEvents: .TouchUpInside);
        button.setTitleColor(UIColor.blueColor(), forState: .Normal);
        self.view .addSubview(button);
        button.frame = CGRectMake(100, 100, 100, 50);
    }
    
    func play() {
        activityIndicator.startAnimating();
    }
    
    func stop()
    {
        activityIndicator.stopAnimating();
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
