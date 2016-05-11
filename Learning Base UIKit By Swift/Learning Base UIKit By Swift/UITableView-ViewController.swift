//
//  UITableView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UITableView_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data:[String]?;
    var tableView:UITableView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //data
        let path = NSBundle.mainBundle().pathForResource("Controls", ofType: "plist");
        self.data = NSArray(contentsOfFile: path!) as? Array;

        //talbleview
        self.tableView = UITableView(frame: self.view.bounds);
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.view.addSubview(self.tableView!);
        
        let headerLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.size.width, 30));
        headerLabel.backgroundColor = UIColor.blackColor();
        headerLabel.textColor = UIColor.whiteColor();
        headerLabel.numberOfLines = 0;
        headerLabel.lineBreakMode = .ByWordWrapping;
        headerLabel.text = "常见 UIKit 控件";
        headerLabel.font = UIFont.italicSystemFontOfSize(20);
        headerLabel.textAlignment = .Center;
        self.tableView!.tableHeaderView = headerLabel;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.data?.count)!;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell;
        cell.accessoryType = .DisclosureIndicator;
        cell.textLabel?.text = self.data![indexPath.row];
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        let itemString = self.data![indexPath.row];
        let alert = UIAlertView(title: "提示", message: "你点击了 \(itemString)", delegate: nil, cancelButtonTitle: "确定");
        alert.show();
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row;
        self.data?.removeAtIndex(index);
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top);
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete;
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "ShangChu";
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
