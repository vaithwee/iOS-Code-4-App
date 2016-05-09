//
//  UIGestureRecognizer-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/9.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

class UIGestureRecognizer_ViewController: UIViewController {

    var rect:UIView!;
    override func viewDidLoad() {
        super.viewDidLoad()

        //滑动
        let swipe = UISwipeGestureRecognizer(target: self, action: Selector("swipe:"));
        swipe.direction = .Up;
        self.view.addGestureRecognizer(swipe);
        
        //单击
        let tap = UITapGestureRecognizer(target: self, action: Selector("tap:"));
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        
        
        //双击
        let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"));
        doubleTap.numberOfTouchesRequired = 1;
        doubleTap.numberOfTapsRequired = 2;
        
        tap .requireGestureRecognizerToFail(doubleTap);//手势互斥
        self.view.addGestureRecognizer(tap);
        self.view.addGestureRecognizer(doubleTap);
        
        //捏合手势
        let pinch = UIPinchGestureRecognizer(target: self, action: Selector("pinch:"));
        self.view.addGestureRecognizer(pinch);
        
        //旋转手势
        let rotation = UIRotationGestureRecognizer(target: self, action: Selector("rotation:"));
        self.view.addGestureRecognizer(rotation);
    
        //拖动
        rect = UIView(frame: CGRectMake(0, 0, 100, 100));
        rect.center = self.view.center;
        rect.backgroundColor = UIColor.redColor();
        self.view.addSubview(rect);
        
        let pan = UIPanGestureRecognizer(target: self, action: Selector("pan:"));
        rect.addGestureRecognizer(pan);
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("longPress:"));
        tap.requireGestureRecognizerToFail(longPress);
        self.view.addGestureRecognizer(longPress);
        
    }
    
    func longPress(ges:UILongPressGestureRecognizer)
    {
        if ges.state == .Began
        {
            print("长按响应开始");
        }
        else {
            print("长按响应结束");
        }
    }
    
    func pan(ges:UIPanGestureRecognizer)
    {
        let point = ges.locationInView(self.view);
        rect.center = point;
    }
    
    
    func rotation(ges:UIRotationGestureRecognizer)
    {
        print("旋转了：\(ges.rotation*(180/CGFloat(M_PI)))");
    }
    
    func pinch(ges:UIPinchGestureRecognizer)
    {
        print("缩放了:\( ges.scale)");
    }
    
    func tap(ges:UITapGestureRecognizer)
    {
        print("单击了");
    }
    
    func  doubleTap(ges:UITapGestureRecognizer)
    {
        print("双击了");
    }
    
    func swipe(ges:UISwipeGestureRecognizer)
    {
        print("swipe ok");
        let point = ges.locationInView(self.view);
        print("起点：x = \(point.x) y = \(point.y)" );
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
