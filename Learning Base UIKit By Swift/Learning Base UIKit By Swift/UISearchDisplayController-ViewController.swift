//
//  UISearchDisplayController-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UISearchDisplayController_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchDisplay:UISearchDisplayController?;
    var data:[String] = ["Label","Button1-初级","Button1-高级","Button2-初级","Button2-高级","Switch"];
    var dataSel:[String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.searchDisplay = UISearchDisplayController(searchBar: self.searchBar, contentsController: self);
        self.dataSel = self.data;
        // Do any additional setup after loading the view.
        
        self.searchDisplay?.searchResultsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.searchDisplay?.searchResultsTableView.dataSource = self;
        self.searchDisplay?.searchBar.placeholder = "输入搜索信息";
        self.searchDisplay?.searchBar.prompt = "搜索组件名称";
        self.searchDisplay?.searchBar.searchBarStyle = .Minimal;
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsScopeBar = true;
        self.searchDisplay?.searchBar.scopeButtonTitles = ["全部", "初级", "高级"];
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataSel = [];
        if (searchText == "")
        {
            self.dataSel = self.data;
        }
        else
        {
            for str in self.data
            {
                if str.lowercaseString.hasPrefix(searchText.lowercaseString)
                {
                    if self.searchBar.selectedScopeButtonIndex == 1
                    {
                        if str.containsString("初级")
                        {
                            self.dataSel.append(str);
                        }
                    }
                    else if self.searchBar.selectedScopeButtonIndex == 2
                    {
                        if str.containsString("高级")
                        {
                            self.dataSel.append(str);
                        }
                    }
                    else
                    {
                        self.dataSel.append(str);
                    }
                    
                    
                }
            }
        }
        self.searchDisplay?.searchResultsTableView.reloadData();
        self.searchDisplay?.searchResultsTableView.keyboardDismissMode = .OnDrag;
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.searchBar(self.searchBar, textDidChange: self.searchBar.text!);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSel.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath);
        cell.textLabel?.text = self.dataSel[indexPath.row];
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
