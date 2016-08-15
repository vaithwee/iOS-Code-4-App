//
//  ViewController.swift
//  CircleTransition by Swift
//
//  Created by Vaith on 16/8/15.
//  Copyright © 2016年 Vaith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var button: UIButton!
    @IBAction func pop(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
}

