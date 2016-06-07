//
//  UIRefreshControl-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIRefreshControl_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var refreshControl = UIRefreshControl();

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;

        self.refreshControl.addTarget(self, action:#selector(UIRefreshControl_ViewController.refresh) , forControlEvents: .ValueChanged);
        self.refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据");
        self.tableView.addSubview(refreshControl);
        // Do any additional setup after loading the view.
    }
    
    func refresh()
    {
        dispatch_async(dispatch_get_main_queue()) { 
            sleep(2);
            print("刷新成功");
            self.refreshControl.endRefreshing();
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = "\(indexPath.row)";
        return cell;
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
