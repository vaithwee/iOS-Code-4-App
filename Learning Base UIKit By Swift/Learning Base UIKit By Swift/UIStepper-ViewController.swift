//
//  UIStepper-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIStepper_ViewController: UIViewController {

    var stepper:UIStepper!;
    var label:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper = UIStepper();
        stepper.center = self.view.center;
        stepper.maximumValue = 10;
        stepper.minimumValue = 1;
        stepper.value = 5.5;
        stepper.stepValue = 0.5;
        
        stepper.continuous = true;//是否可以长安
        stepper.wraps = true;//是否可以循环大小
        
        //stepper.tintColor = UIColor.redColor();//更改颜色
        
        stepper.addTarget(self, action: #selector(UIStepper_ViewController.stepperValueChange), forControlEvents: .ValueChanged);
        self.view.addSubview(stepper);
        
        //设置图片
        stepper.setDecrementImage(UIImage(named: "reduce"), forState: .Normal);
        stepper.setIncrementImage(UIImage(named: "plus"), forState: .Normal);
        
        label = UILabel(frame: CGRectMake(100,190,300,30));
        label.textColor = UIColor.blackColor();
        print(stepper.value);
        label.text = "当前值为：\(stepper.value)";
        self.view.addSubview(label);
        
        
        // Do any additional setup after loading the view.
    }
    
    func stepperValueChange()
    {
          label.text = "当前值为：\(stepper.value)";
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
