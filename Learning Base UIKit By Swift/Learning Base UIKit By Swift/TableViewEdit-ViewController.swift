//
//  TableViewEdit-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class TableViewEdit_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        // Do any additional setup after loading the view.
        
        let longPressGes = UILongPressGestureRecognizer(target: self, action: #selector(TableViewEdit_ViewController.edit))
        self.tableView.addGestureRecognizer(longPressGes);
    }
    
    func edit(ges:UILongPressGestureRecognizer)
    {
        if ges.state == .Ended
        {
            if self.tableView.editing == false {
                self.tableView.setEditing(true, animated: true);
            }
            else
            {
                self.tableView.setEditing(false, animated: true);
            }
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        print("从\(sourceIndexPath.row) 移动到了 \(destinationIndexPath.row)");
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath);
        cell.selectionStyle = .None;
        cell.accessoryType = .DisclosureIndicator;
        cell.textLabel?.text = "\(indexPath.row) 行";
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
