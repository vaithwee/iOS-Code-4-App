//
//  UIImagePickerController-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIImagePickerController_ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var edit: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showImagePickerContoller(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        {
            let picker = UIImagePickerController();
            picker.delegate = self;
            picker.sourceType = .PhotoLibrary;
            picker.allowsEditing = self.edit.on;
            self.presentViewController(picker, animated: true, completion: nil);
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        imageView.image = image;
        picker.dismissViewControllerAnimated(true, completion: nil);
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
