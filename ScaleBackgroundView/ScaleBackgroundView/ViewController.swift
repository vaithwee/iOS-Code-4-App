//
//  ViewController.swift
//  ScaleBackgroundView
//
//  Created by OrangeLife on 16/5/5.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //获取底部视图
    var rootViewController:UIViewController {
        return (UIApplication.sharedApplication().keyWindow?.rootViewController)!;
    }
    
    //遮罩层
    lazy var maskLayer:UIView =  {
        let maskLayer = UIView.init(frame: UIScreen.mainScreen().bounds);
        maskLayer.backgroundColor = UIColor.init(white: 0.0, alpha: 0.5);
        maskLayer.alpha = 0;
        
        let closeButton = UIButton.init(frame: maskLayer.bounds);
        closeButton.addTarget(self, action: Selector("close"), forControlEvents: .TouchUpInside);
        maskLayer.addSubview(closeButton);
        
        return maskLayer;
    }()
    
    lazy var popView:UIView = {
        let popView = UIView.init(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2));
        popView.backgroundColor = UIColor.whiteColor();
        return popView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func show(sender: AnyObject) {
        open();
    }
    
    //MARK: 开启
    private func open()
    {
        //添加视图
        self.rootViewController.view .addSubview(self.maskLayer);
        UIApplication.sharedApplication().keyWindow?.addSubview(self.popView);
        UIApplication.sharedApplication().keyWindow?.backgroundColor = UIColor.blackColor();
        
        //计算位置
        var frame = self.popView.frame;
        frame.origin.y -= frame.size.height;
        
        //第一步动画
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.rootViewController.view.layer.transform = self.getFirstTransform();
            }) { (finished) -> Void in
                //第二步动画
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.rootViewController.view.layer.transform = self.getSecondTransform();
                    self.maskLayer.alpha = 1;
                    self.popView.frame = frame;
                    }, completion: { (finished) -> Void in
                        
                })
        };
    }
    
    //MARK: 关闭
    func close()
    {
        var frame = self.popView.frame;
        frame.origin.y += frame.size.height;
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.rootViewController.view.layer.transform = self.getFirstTransform();
            self.popView.frame = frame;
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.rootViewController.view.layer.transform = CATransform3DIdentity;
                    self.maskLayer.alpha = 0;
                    }, completion: { (finished) -> Void in
                        self.maskLayer.removeFromSuperview();
                        self.popView.removeFromSuperview();
                        UIApplication.sharedApplication().keyWindow?.backgroundColor = UIColor.whiteColor();
                })
        }
    }
    
    //MARK: 获取第一次转换
    func getFirstTransform() -> CATransform3D
    {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -900.0;
        transform = CATransform3DScale(transform, 0.95, 0.95, 1);
        transform = CATransform3DRotate(transform, CGFloat(15.0*M_PI/180.0), 1, 0, 0);
        transform = CATransform3DTranslate(transform, 0, 0, -100.0)
        return transform;
    }
    
    //MARK: 获取第二次转换
    func getSecondTransform() -> CATransform3D
    {
        var transform = CATransform3DIdentity;
        transform.m34 = self.getFirstTransform().m34;
        transform = CATransform3DTranslate(transform, 0, self.view.frame.size.height * -0.08, 0);
        transform = CATransform3DScale(transform, 0.8, 0.8, 1.0);
        return transform;
    }
    
    
    
}

