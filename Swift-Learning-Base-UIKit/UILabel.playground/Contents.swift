//: Playground - noun: a place where people can play

import UIKit

let label = UILabel(frame: CGRectMake(10,20,300,100));
label.text = "Hello, welcome to swift world, This is a simple label demo";

//背景颜色和文字颜色
label.textColor = UIColor.whiteColor();
label.backgroundColor = UIColor.blackColor();

//对齐方式
label.textAlignment = NSTextAlignment.Center;

//文字阴影设置
label.shadowColor = UIColor.grayColor();
label.shadowOffset = CGSizeMake(-5, 5);

//字体设置
label.font = UIFont(name: "Zapfino", size: 20);

//文字大小自适应标签宽度
label.adjustsFontSizeToFitWidth = true;

//标签可以显示多行
label.numberOfLines = 2;

//设置文本高亮
label.highlighted = true;
label.highlightedTextColor = UIColor.greenColor();

//富文本设置
let attr = NSMutableAttributedString(string: "Welcome to Swift World");
attr.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 20)!, range: NSMakeRange(0, 6));
attr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(0, 3));
attr.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: NSMakeRange(3, 3));
label.attributedText = attr;
