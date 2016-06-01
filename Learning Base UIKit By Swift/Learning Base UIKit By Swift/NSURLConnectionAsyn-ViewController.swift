//
//  NSURLConnectionAsyn-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/30.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class NSURLConnectionAsyn_ViewController: UIViewController , HttpPortocol{

    var http:HttpController = HttpController();
    
    var channel:NSArray = NSArray();
    
    
    func didRecieveResults(resultes: NSDictionary) {
        print(resultes);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self;
        http.onSearch("http://www.douban.com/j/app/radio/channels");
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func request(sender: AnyObject) {
        
        let imageUrl:NSURL = NSURL(string: "http://hangge.com/blog/images/logo.png")!;
        let request:NSURLRequest = NSURLRequest(URL: imageUrl);
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (_, data, _) in
            let image = UIImage(data: data!);
            self.imageView.image = image;
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
