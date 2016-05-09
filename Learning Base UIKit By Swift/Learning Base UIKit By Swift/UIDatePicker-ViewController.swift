//
//  UIDatePicker-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIDatePicker_ViewController: UIViewController {

    @IBOutlet weak var dataPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataPicker.locale = NSLocale(localeIdentifier: "zh_CN");//修改问中文
        dataPicker.addTarget(self, action: Selector("dateValueChanged"), forControlEvents: .ValueChanged);
        // Do any additional setup after loading the view.
    }
    
    func dateValueChanged()
    {
        let formatter = NSDateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print(formatter.stringFromDate(dataPicker.date))
    }

    @IBAction func showDatePicker(sender: AnyObject) {
        
        let date = dataPicker.date;
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss";
        let dateStr = dateFormatter.stringFromDate(date);
        let message = "你选择的时间日期是：\(dateStr)";
        let alertViewControl = UIAlertController(title: "当前时间日期", message: message, preferredStyle: .Alert);
        let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil);
        alertViewControl.addAction(cancelAction);
        self.presentViewController(alertViewControl, animated: true, completion: nil);
        
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
