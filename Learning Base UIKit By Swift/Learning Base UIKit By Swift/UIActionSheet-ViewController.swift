//
//  UIActionSheet-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/5/7.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIActionSheet_ViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionSheet = UIActionSheet();
        actionSheet.title = "请选择操作"
        actionSheet.addButtonWithTitle("取消");
        actionSheet.addButtonWithTitle("动作1");
        actionSheet.addButtonWithTitle("动作2");
        actionSheet.cancelButtonIndex = 0;
        actionSheet.delegate = self;
        actionSheet.showInView(self.view)
        // Do any additional setup after loading the view.
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        print("点击了"+actionSheet.buttonTitleAtIndex(buttonIndex)!);
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
