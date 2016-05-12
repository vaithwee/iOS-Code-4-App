//
//  NSURL_ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class NSURL_ViewController: UIViewController , NSURLConnectionDataDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func getSync(sender: AnyObject) {
        let urlStr:String = "http://www.hangge.com/getscore.php?user=hangge";
        let url:NSURL!;
        url = NSURL(string: urlStr);
        let request = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "GET";
        var response:NSURLResponse?
        do {
            let recived:NSData? = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response);
            let datastring = NSString(data: recived!, encoding: NSUTF8StringEncoding);
            print("请求结果:",datastring!);
        }
        catch let error as NSError
        {
            print(error.description);
        }
        
    }
    @IBAction func getAsync(sender: AnyObject) {
        let urlStr:String = "http://www.hangge.com/getscore.php?user=hangge";
        let url:NSURL!;
        url = NSURL(string: urlStr);
        let request = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "GET";
        
        var conn:NSURLConnection!
        conn = NSURLConnection(request: request, delegate: self);
        conn.start();
        print(conn);
        
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        print("请求成功！");
        print(response);
    }
    
    
    @IBAction func postSync(sender: AnyObject) {
        
    }
    
    @IBAction func postAsync(sender: AnyObject) {
        
    }
    
    

}
