//
//  XIb-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/30.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class XIb_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show(sender: AnyObject) {
        
        let control = XibDetailViewController(nibName: "XibDetailViewController", bundle: nil);
        control.modalTransitionStyle = .CrossDissolve;
        self.presentViewController(control, animated: true, completion: nil);
        
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
