//
//  UIScrollView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIScrollView_ViewController: UIViewController , UIScrollViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: self.view.bounds);
        let imageView = UIImageView(image: UIImage(named: "city"));
        scrollView.contentSize = imageView.bounds.size;
        scrollView.addSubview(imageView);
        scrollView.delegate = self;
        self.view.addSubview(scrollView);
        
        //缩放
        scrollView.minimumZoomScale = 0.1;
        scrollView.maximumZoomScale = 3;
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        for subview in scrollView.subviews
        {
            if subview.isKindOfClass(UIImageView){
                return subview;
            }
        }
        return nil;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)");
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
