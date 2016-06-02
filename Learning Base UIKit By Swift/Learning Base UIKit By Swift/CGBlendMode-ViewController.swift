//
//  CGBlendMode-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class CGBlendMode_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swift  = UIImageView(image: UIImage(named: "swift"));
        self.view.addSubview(swift);
        swift.center = CGPointMake(100, 100);
        
        let yellowSwift = UIImageView(image: UIImage(named: "swift")?.tint(UIColor.yellowColor(), blendMode: .DestinationIn));
        self.view.addSubview(yellowSwift);
        yellowSwift.center = CGPointMake(100, 200);
        
    let image =      UIImage(named: "swift")?.imageWithRenderingMode(.AlwaysTemplate);
        swift.image = image;
        swift.tintColor = UIColor.lightGrayColor();
        // Do any additional setup after loading the view.
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
