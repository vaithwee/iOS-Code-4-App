//
//  UIScrollViewPage-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIScrollViewPage_ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: self.view.bounds);
        scrollView.contentSize = CGSizeMake(self.view.bounds.width*3, self.view.bounds.size.height-64);
        scrollView.pagingEnabled = true;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.scrollsToTop = false;
        scrollView.bounces = false;
        
        for i in 0..<3
        {
            let pageViewController = PageViewController(number: i+1);
            pageViewController.view.frame = CGRectMake(self.view.bounds.size.width*CGFloat(i), 0, self.view.bounds.size.width, self.view.bounds.size.height);
            scrollView.addSubview(pageViewController.view);
            
        }
        
        self.view.addSubview(scrollView);
        
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


class PageViewController:UIViewController
{
    var number:Int!
    let colorMap=[
        1:UIColor.blackColor(),
        2:UIColor.orangeColor(),
        3:UIColor.blueColor()
    ]
    
    init(number initNumber:Int){
        self.number = initNumber
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        let numberLabel = UILabel(frame:CGRectMake(130,50,50,30))
        numberLabel.text = "第\(number)页"
        numberLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
    }
}
