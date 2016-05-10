//
//  UIWebView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/10.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIWebView_ViewController: UIViewController {

    @IBOutlet weak var typeChange: UISegmentedControl!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        typeChange.selectedSegmentIndex = 0;
        typeChanged(typeChange);
        // Do any additional setup after loading the view.
    }

    @IBAction func typeChanged(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex;
        switch index
        {
        case 0:
            let html = "<h1>welcome to swift world</h1>"
            webView.loadHTMLString(html, baseURL: nil);
        case 1:
            let path = NSBundle.mainBundle().pathForResource("test", ofType: "pdf");
            webView.loadRequest(NSURLRequest(URL: NSURL.fileURLWithPath(path!)));
        case 2:
            let path = NSBundle.mainBundle().pathForResource("test", ofType:"pdf");
            let urlStr = NSURL.fileURLWithPath(path!);
            let data = NSData(contentsOfURL: urlStr);
            webView.loadData(data!, MIMEType: "application/pdf", textEncodingName: "utf-8", baseURL: NSURL());
        default:
            print("none");
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
