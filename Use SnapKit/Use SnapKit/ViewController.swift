//
//  ViewController.swift
//  Use SnapKit
//
//  Created by OrangeLife on 16/6/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var data:[String] = ["Simple","Double","Inset","Offset","MultipliedBy","Uninstall","Update","Animation"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath);
        cell.textLabel?.text = self.data[indexPath.row];
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        self.performSegueWithIdentifier(self.data[indexPath.row], sender: nil);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

