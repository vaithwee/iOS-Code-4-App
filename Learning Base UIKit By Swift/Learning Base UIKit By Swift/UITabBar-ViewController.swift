//
//  UITabBar-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UITabBar_ViewController: UIViewController, UITabBarDelegate {

    
    @IBOutlet weak var label: UILabel!
    var tabbar:UITabBar!;
    let tabs = ["公开课","全栈课","设置"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabbar = UITabBar(frame: CGRectMake(0, CGRectGetHeight(self.view.bounds) - 64, self.view.frame.size.width, 64));
        var items:[UITabBarItem] = [];
        for tab in self.tabs
        {
            let tabItem = UITabBarItem();
            tabItem.title = tab;
            items.append(tabItem);
        }
        self.tabbar.setItems(items, animated: true);
        tabbar.delegate = self;
        self.view.addSubview(self.tabbar);
        // Do any additional setup after loading the view.
        self.tabBar(self.tabbar, didSelectItem: items[0]);
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.label.text = item.title;
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
