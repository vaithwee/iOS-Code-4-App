//
//  NSURLSession-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class NSURLSession_ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestData(sender: AnyObject) {
        let urlString = "http://hangge.com";
        let url = NSURL(string: urlString);
        let requesst = NSURLRequest(URL: url!);
        let session = NSURLSession.sharedSession();
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
            } as NSURLSessionTask;
        task.resume();
    }
    
    @IBAction func downFile(sender: AnyObject) {
        let url  = NSURL(string: "http://7te8s5.com2.z0.glb.qiniucdn.com/web_1464328764177232.jpg");
        let request = NSURLRequest(URL: url!);
        let session = NSURLSession.sharedSession();
        let task = session.downloadTaskWithRequest(request) { (location, response, error) in
            print("location:\(location)");
            let locationpath = location!.path;
            let documents:String = NSHomeDirectory() + "/Documents/1.png";
            let fileManager:NSFileManager = NSFileManager.defaultManager();
            try! fileManager.moveItemAtPath(locationpath!, toPath: documents);
            print("new localtionn:\(documents)");
        }
        
        task.resume();
        
    }
    @IBAction func downFileWithProgress(sender: AnyObject) {
        let url  = NSURL(string: "http://7te8s5.com2.z0.glb.qiniucdn.com/web_1464328764177232.jpg");
        let request = NSURLRequest(URL: url!);
        let session = self.currentSession();
        let task = session.downloadTaskWithRequest(request);
        task.resume();
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        print("下载结束");
        print("location:\(location)");
        let path = location.path;
        let toPath = NSHomeDirectory() + "/Documents/2.jpg";
        let fileManager = NSFileManager.defaultManager();
        try! fileManager.moveItemAtPath(path!, toPath: toPath);
        print("now location:\(toPath)");
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let written = CGFloat(totalBytesWritten);
        let total = CGFloat(totalBytesExpectedToWrite);
        let pro = written/total;
        print("下载进度:\(pro)")
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        //用于断点续传
    }
    
    func currentSession() -> NSURLSession
    {
        var predicate:dispatch_once_t = 0;
        var currentSession:NSURLSession? = nil;
        dispatch_once(&predicate) { 
            let config = NSURLSessionConfiguration.defaultSessionConfiguration();
            currentSession = NSURLSession(configuration: config, delegate: self, delegateQueue: nil);
        }
        return currentSession!;
    }
    
    @IBAction func uploadFile(sender: AnyObject) {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://hangge.com/upload.php")!);
        request.HTTPMethod = "POST";
        request.cachePolicy = .ReloadIgnoringLocalCacheData;
        
        let path = NSHomeDirectory() + "/Documents/1.png";
        let data = NSData(contentsOfFile: path);
        let task = NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: data) { (data, _, error) in
            if error != nil
            {
                print(error?.code);
                print(error?.description);
            }
            else
            {
                let str = NSString(data: data!, encoding: NSUTF8StringEncoding);
                print(str);
            }
        }
        task.resume();
        
        
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
