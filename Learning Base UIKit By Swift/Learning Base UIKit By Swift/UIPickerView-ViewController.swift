//
//  UIPickerView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/5/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIPickerView_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerView:UIPickerView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView();
        pickerView.dataSource = self;
        pickerView.delegate = self;
        pickerView.selectRow(1, inComponent: 0, animated: true);
        pickerView.selectRow(2, inComponent: 1, animated: true);
        pickerView.selectRow(3, inComponent: 2, animated: true);
        self.view.addSubview(pickerView);
        
        let button = UIButton(frame: CGRectMake(0,0,100,30));
        button.center = self.view.center;
        button.backgroundColor = UIColor.blueColor();
        button.setTitle("获取信息", forState: .Normal);
        button.addTarget(self, action: #selector(UIPickerView_ViewController.getPickerViewValue), forControlEvents: .TouchUpInside);
        self.view.addSubview(button);
        // Do any additional setup after loading the view.
    }
    
    func getPickerViewValue()
    {
        let alertView = UIAlertView();
        alertView.title = "被选中的索引为"
        alertView.message = String(pickerView.selectedRowInComponent(0)) + "-" + String(pickerView.selectedRowInComponent(1)) + "-" + String(pickerView.selectedRowInComponent(2));
        alertView.addButtonWithTitle("OK");
        alertView.show();
        
    }
    
    //MAKR: 列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3;
    }
    
    //MARK: 行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9;
    }
    
    //MARK: 标题
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(component) + "-" + String(row);
    }
    
    //MARK: 列宽
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if 0 == component
        {
            return 150;
        }
        else
        {
            return 50;
        }
    }
    
    //MARK: 行高
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("选择了\(component)-\(row)");
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
