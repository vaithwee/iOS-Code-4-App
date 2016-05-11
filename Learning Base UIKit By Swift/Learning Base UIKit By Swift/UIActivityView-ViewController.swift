//
//  UIActivityView-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/11.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIActivityView_ViewController: UIViewController {

    @IBAction func share(sender: AnyObject) {
        let items = ["Wee", UIImage(named: "swift")!, NSURL(fileURLWithPath: "http://www.baidu.com")];
        let acts = [WeeActivity(),WeiXinActivity()];
        let actView:UIActivityViewController = UIActivityViewController(activityItems: items, applicationActivities: acts);
        //去除自带按钮
        actView.excludedActivityTypes = [UIActivityTypeMail,UIActivityTypeCopyToPasteboard,
            UIActivityTypePrint,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        
        //显示分享视图
        self.presentViewController(actView, animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class WeiXinActivity : UIActivity {
    //用于保存传递过来的要分享的数据
    var text:String!
    var url:NSURL!
    var image:UIImage!
    
    //显示在分享框里的名称
    override func activityTitle() -> String? {
        return "微信"
    }
    
    //分享框的图片
    override func activityImage() -> UIImage? {
        return UIImage(named:"c")
    }
    
    //分享类型，在UIActivityViewController.completionHandler回调里可以用于判断，一般取当前类名
    override func activityType() -> String? {
        return WeiXinActivity.self.description()
    }
    
    //按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class func activityCategory() -> UIActivityCategory{
        return UIActivityCategory.Action
    }
    
    //是否显示分享按钮，这里一般根据用户是否授权,或分享内容是否正确等来决定是否要隐藏分享按钮
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is NSURL {
                return true
            }
        }
        return false
    }
    
    //解析分享数据时调用，可以进行一定的处理
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        print("prepareWithActivityItems")
        for item in activityItems {
            if item is UIImage {
                image = item as! UIImage
            }
            if item is String {
                text = item as! String
            }
            if item is NSURL {
                url = item as! NSURL
            }
        }
    }
    
    //执行分享行为
    //这里根据自己的应用做相应的处理
    //例如你可以分享到另外的app例如微信分享，也可以保存数据到照片或其他地方，甚至分享到网络
    override func performActivity() {
        print("performActivity")
        //具体的执行代码这边先省略
    }
    
    //分享时调用
    override func activityViewController() -> UIViewController? {
        print("activityViewController")
        return nil
    }
    
    //完成分享后调用
    override func activityDidFinish(completed: Bool) {
        print("activitydidfinish")
    }
}

class WeeActivity : UIActivity {
    //用于保存传递过来的要分享的数据
    var text:String!
    var url:NSURL!
    var image:UIImage!
    
    //显示在分享框里的名称
    override func activityTitle() -> String? {
        return "Wee"
    }
    
    //分享框的图片
    override func activityImage() -> UIImage? {
        return UIImage(named:"swift.png")
    }
    
    //分享类型，在UIActivityViewController.completionHandler回调里可以用于判断，一般取当前类名
    override func activityType() -> String? {
        return WeeActivity.self.description()
    }
    
    //按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class func activityCategory() -> UIActivityCategory{
        return UIActivityCategory.Share
    }
    
    //是否显示分享按钮，这里一般根据用户是否授权,或分享内容是否正确等来决定是否要隐藏分享按钮
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is NSURL {
                return true
            }
        }
        return false
    }
    
    //解析分享数据时调用，可以进行一定的处理
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        print("prepareWithActivityItems")
        for item in activityItems {
            if item is UIImage {
                image = item as! UIImage
            }
            if item is String {
                text = item as! String
            }
            if item is NSURL {
                url = item as! NSURL
            }
        }
    }
    
    //执行分享行为
    //这里根据自己的应用做相应的处理
    //例如你可以分享到另外的app例如微信分享，也可以保存数据到照片或其他地方，甚至分享到网络
    override func performActivity() {
        print("performActivity")
        //具体的执行代码这边先省略
    }
    
    //分享时调用
    override func activityViewController() -> UIViewController? {
        print("activityViewController")
        return nil
    }
    
    //完成分享后调用
    override func activityDidFinish(completed: Bool) {
        print("activitydidfinish")
    }
}
