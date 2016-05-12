//
//  Animation-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class Animation_ViewController: UIViewController {
    
    var backgrounds:[UIView] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        let x:CGFloat = 20.0;
        let y:CGFloat = 20.0;
        let width:CGFloat = 50;
        let height:CGFloat = 50;
        for i in 0..<4
        {
            for j in 0..<4
            {
                let view = UIView(frame: CGRectMake(x+(width+x)*CGFloat(j), 64+y+CGFloat(i)*(height+y), width, height));
                view.backgroundColor = UIColor.redColor();
                self.view.addSubview(view);
                backgrounds.append(view);
            }
        }
        

        for view in backgrounds
        {
            view.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1));
            UIView.animateWithDuration(1, delay: 0.01, options: .TransitionNone, animations: { () -> Void in
                view.layer.setAffineTransform(CGAffineTransformMakeRotation(90));
                }, completion: { (finished) -> Void in
                    UIView.animateWithDuration(1, animations: { () -> Void in
                        view.layer.setAffineTransform(CGAffineTransformIdentity);
                    })
            })
        }

                /*
        for view in backgrounds
        {
            view.alpha = 0;
            UIView.beginAnimations(nil, context: nil);
            UIView.setAnimationDuration(1);
            view.alpha = 1;
            UIView.commitAnimations()

        }
     */
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
