//: Playground - noun: a place where people can play

import UIKit

//创建按钮
let addButton = UIButton(type: .ContactAdd);
addButton.frame = CGRectMake(10, 10, 200, 30);
addButton.setTitle("按钮", forState: .Normal);


//按钮文字设置
let button = UIButton(frame: CGRectMake(10, 100, 400, 30));
button.setTitle("普通状态", forState: .Normal);
button.setTitle("触摸状态", forState: .Highlighted);
button.setTitle("禁用", forState: .Disabled);

//按钮文字颜色设置
button.setTitleColor(UIColor.blackColor(), forState: .Normal);
button.setTitleColor(UIColor.greenColor(), forState: .Highlighted);
button.setTitleColor(UIColor.grayColor(), forState: .Disabled);

//按钮的阴影颜色
button.titleLabel?.shadowOffset = CGSizeMake(5, 5);
button.setTitleShadowColor(UIColor.greenColor(), forState: .Normal);
button.setTitleShadowColor(UIColor.yellowColor(), forState: .Highlighted);
button.setTitleShadowColor(UIColor.grayColor(), forState: .Disabled);

//按钮背景颜色的设置
button.backgroundColor = UIColor.blackColor();
[#Image(imageLiteral: "icon.png")#]
//按钮文字图标的设置
//button.setImage(UIImage(named: "icon"), forState: .Normal);
button.adjustsImageWhenHighlighted = false;
button.adjustsImageWhenDisabled = false;

//按钮的背景图片
button.setBackgroundImage(UIImage(named: "icon"), forState: .Normal);

//时间处理
button.addTarget(nil, action: Selector("click"), forControlEvents: .TouchUpInside);

func click()
{
    print("Hello, World");
}



