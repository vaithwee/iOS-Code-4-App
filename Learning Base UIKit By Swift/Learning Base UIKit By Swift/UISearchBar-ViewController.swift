//
//  UISearchBar-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UISearchBar_ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data:[String] = ["Label","Button1","Button2","Switch"];
    var dataSel:[String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSel = self.data;
        self.searchBar.showsScopeBar = true;
        self.searchBar.scopeButtonTitles = ["title1", "title2"];
        self.searchBar.delegate = self;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSel.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell;
        cell.textLabel?.text = self.dataSel[indexPath.row];
        return cell;
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope);
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            self.dataSel = self.data;
        }
        else
        {
            self.dataSel = [];
            for ctrl in self.data
            {
                if ctrl.lowercaseString.hasPrefix(searchText.lowercaseString)
                {
                    self.dataSel.append(ctrl);
                }
            }
        }
        self.tableView.reloadData();
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
