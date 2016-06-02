//
//  UISearchController-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UISearchController_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    var tableView:UITableView!;
    var searchControl:UISearchController = UISearchController();
    
    let data = ["A","ABC","AC","AS","SD","RG","WE","IG","RNG"];
    var searchData:[String] = [String](){
        didSet
        {
            self.tableView.reloadData();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain);
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.view.addSubview(self.tableView);
        
        self.searchControl = ({
            let control = UISearchController(searchResultsController: nil);
            control.searchResultsUpdater = self;
            control.hidesNavigationBarDuringPresentation = false;
            control.dimsBackgroundDuringPresentation = false;
            control.searchBar.searchBarStyle = .Minimal;
            control.searchBar.sizeToFit();
            self.tableView.tableHeaderView = control.searchBar;
            return control;
        })()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchControl.active
        {
            return self.searchData.count;
        }
        else
        {
            return self.data.count;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath);
        if self.searchControl.active
        {
            cell.textLabel?.text = self.searchData[indexPath.row];
        }
        else
        {
            cell.textLabel?.text = self.data[indexPath.row];
        }
        return cell;
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.searchData.removeAll(keepCapacity: false);
        let predicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!);
        let array = (self.data as NSArray).filteredArrayUsingPredicate(predicate);
        self.searchData = array as! [String];
    }

}
