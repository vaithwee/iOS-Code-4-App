//
//  Shake-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class Shake_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("Shake Begin");
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("Shake Ended");
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("Shake Cancel");
    }

}
