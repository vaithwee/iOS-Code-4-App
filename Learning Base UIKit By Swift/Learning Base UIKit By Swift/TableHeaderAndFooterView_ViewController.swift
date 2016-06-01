//
//  TableHeaderAndFooterView_ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class TableHeaderAndFooterView_ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.mainScreen().bounds;
        /*header*/
        let headerLabel = UILabel(frame: CGRectMake(0,0,frame.size.width, 100));
        headerLabel.backgroundColor = UIColor.redColor();
        headerLabel.text = "Header";
        headerLabel.textAlignment = .Center;
        tableView.tableHeaderView = headerLabel;
        
        /*footer*/
        
        let footerView = UIView(frame: CGRectMake(0,0,frame.size.width, 50));
        footerView.backgroundColor = UIColor.yellowColor();
        
        let label = UILabel(frame: footerView.bounds);
        label.text = "footer";
        label.textAlignment = .Center;
        footerView.addSubview(label);
        
        tableView.tableFooterView = footerView;
        
        
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
