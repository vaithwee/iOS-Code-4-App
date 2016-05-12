//
//  NSJSONSerialization-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class NSJSONSerialization_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //转为json
        let user = [
            "username":"张三",
            "tel":["mobile":"138","home":"010"]
        ]
        
        if(NSJSONSerialization.isValidJSONObject(user))
        {
            let data:NSData! = try? NSJSONSerialization.dataWithJSONObject(user, options: []);
            let str = NSString(data: data, encoding: NSUTF8StringEncoding);
            print("Json Str:");
            print(str!);
            
            //把nsdata转为json
            let json:AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments);
            print("Json Object:");print(json);
            let mobile:AnyObject = json.objectForKey("tel")!.objectForKey("mobile")!;
            print(mobile);
        }
        
        let string: NSString = "[{\"ID\":1,\"Name\":\"元台禅寺\",\"LineID\":1},{\"ID\":2,\"Name\":\"田坞里山塘\",\"LineID\":1},{\"ID\":3,\"Name\":\"滴水石\",\"LineID\":1}]";
        let data = string.dataUsingEncoding(NSUTF8StringEncoding);
        let jsonArr = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray;
        for json in jsonArr
        {
            print("ID:", json.objectForKey("ID")!, "    Name:", json.objectForKey("Name")!);
        }
        
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
