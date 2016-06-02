//
//  AddressBookUI-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import AddressBookUI

class AddressBookUI_ViewController: UIViewController , ABPeoplePickerNavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRectMake(0,0,100,40));
        button.setTitle("Address", forState: .Normal);
        button.setTitleColor(UIColor.blackColor(), forState: .Normal);
        button.center = self.view.center;
        button.addTarget(self, action: #selector(AddressBookUI_ViewController.showAddressPicker), forControlEvents: .TouchUpInside);
        self.view.addSubview(button);
    }
    
    func showAddressPicker()
    {
        let picker = ABPeoplePickerNavigationController();
        picker.peoplePickerDelegate = self;
        self.presentViewController(picker, animated: true, completion: nil);
    }
    
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController, didSelectPerson person: ABRecord) {

    }
    
    func peoplePickerNavigationControllerDidCancel(peoplePicker: ABPeoplePickerNavigationController) {
        peoplePicker.dismissMoviePlayerViewControllerAnimated();
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
