//
//  UIPageControl-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIPageControl_ViewController: UIViewController, UIScrollViewDelegate {

    let data = [
        ["name":"Swift","pic":"swift"],
        ["name":"C","pic":"c"],
        ["name":"Java","pic":"java"],
        ["name":"php","pic":"php"],
        ["name":".Net","pic":"net"]
    ]
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * CGFloat(data.count), self.view.bounds.size.width);
        self.scrollView.showsHorizontalScrollIndicator = false;
        self.scrollView.showsVerticalScrollIndicator = false;
        self.scrollView.scrollsToTop = false;
        self.scrollView.pagingEnabled = true;
        self.scrollView.delegate = self;
        let size = self.view.bounds.size;
        for (index, info) in data.enumerate()
        {
            let page = UIView();
            let imageView = UIImageView(image: UIImage(named: info["pic"]!));
            page.addSubview(imageView);
            page.backgroundColor = UIColor.whiteColor();
            let label = UILabel(frame: CGRectMake(20,20,100,20));
            label.text = info["name"];
            page.addSubview(label);
            page.frame = CGRectMake(CGFloat(index) * size.width, 0, size.width, size.height);
            imageView.center = CGPointMake(size.width/2, size.height/2);
            scrollView.addSubview(page);
            
        }
        
        self.pageControl.backgroundColor = UIColor.clearColor();
        self.pageControl.numberOfPages = data.count;
        self.pageControl.currentPage = 0;
        self.pageControl.userInteractionEnabled = true;
        self.pageControl.addTarget(self, action: Selector("pageChanged:"), forControlEvents: .ValueChanged);
        // Do any additional setup after loading the view.
    }
    
    func pageChanged(page:UIPageControl)
    {
        var frame = scrollView.frame;
        frame.origin.x = frame.size.width * CGFloat(page.currentPage);
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: true);
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
        self.pageControl.currentPage = page;
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
