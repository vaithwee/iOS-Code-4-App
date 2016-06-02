//
//  GCDSemaphore-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class GCDSemaphore_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://hangge.com";
        let url = NSURL(string: urlString);
        let requesst = NSURLRequest(URL: url!);
        let session = NSURLSession.sharedSession();
        let semaphore = dispatch_semaphore_create(0);//创建信号
        
        let task = session.dataTaskWithRequest(requesst) { (data, _, error) in
            if error != nil
            {
                print(error?.code);
                print(error?.description);
            }
            else
            {
                print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            }
            dispatch_semaphore_signal(semaphore);
            print("请求完成");
            } as NSURLSessionTask;
        task.resume();
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        print("数据加载完毕");
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
