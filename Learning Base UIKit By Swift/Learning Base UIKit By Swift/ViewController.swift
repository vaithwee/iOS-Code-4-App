//
//  ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/5/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var data:[String] = ["UIAlertView","UIActionSheet","UIPickerView","UIStepper","UIScrollView","UIScrollViewPage","CoreMotion","UIGestureRecognizer","UIDatePicker","UIDatePickerCountDown","UIWebView","Browser","UITableView","UISearchBar","UISearchDisplayController","UICollectionViewSimple","UITabBar","UIPageControl","UIActivityView","Objective-C To Swift","EventKit","UIAlertController","NSJSONSerialization","FactoryClass","Animation","NSUserDefaults","NSURL","UITouch","UIActivityIndicatorView","UINavigationBar","Xib","NSURLConnectionAsyn","WillDisplayCell","MediaPlayer","StaticCells","UILocalNotification","TableViewEdit","TableHeaderAndFooterView","UIImagePickerController","NSURLSession","DeviceDirection","Shake","CoreLocation","MapKit","AddressBookUI","MessageUI","UISearchController","CGBlendMode","RGBColor","GCDSemaphore","QRCode","UIRefreshControl"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = self.data[indexPath.row];
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(self.data[indexPath.row], sender: nil);
    }


}

