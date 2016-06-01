//
//  Browser-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/10.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class Browser_ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var goBtn: UIBarButtonItem!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    
    var loadIndicator:UIActivityIndicatorView!;
    var timer:NSTimer!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressView.hidden = true;
        self.urlTextField.delegate = self;
        self.webView.delegate = self;
        loadIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0, 32,32));
        loadIndicator.center = self.view.center;
        loadIndicator.activityIndicatorViewStyle = .Gray;
        self.view.addSubview(loadIndicator);
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(Browser_ViewController.updateProgress), userInfo: nil, repeats: true);
        NSRunLoop.mainRunLoop().addTimer(self.timer, forMode: NSDefaultRunLoopMode);
        self.timer.invalidate();
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        var url = textField.text;
        if !url!.hasPrefix("http")
        {
            url = "http://" + url!;
        }
        loadUrl(url!);
        return true;
    }
    
    func loadUrl(url:String)
    {
        let urlobj = NSURL(string: url);
        let request = NSURLRequest(URL: urlobj!);
        webView.loadRequest(request);
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.loadIndicator.startAnimating();
        self.progressView.progress = 0;
        self.progressView.hidden = false;
        self.timer.fire();
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loadIndicator.stopAnimating();
        self.progressView.hidden = true;
        self.timer.invalidate();
    }
    
    func updateProgress()
    {
        if(progressView.progress >= 1.0)
        {
            timer.invalidate();
        }
        else
        {
            progressView.setProgress(progressView.progress + 0.02, animated:true);
        }
    }
    
    @IBAction func back(sender: AnyObject) {
        webView.goBack();
        
    }
    @IBAction func forward(sender: AnyObject) {
        webView.goForward();
    }
    
    @IBAction func refresh(sender: AnyObject) {
        webView.reload();
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        webView.stopLoading();
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
