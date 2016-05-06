//: Playground - noun: a place where people can play

import UIKit

let textView = UITextView(frame: CGRectMake(0, 0, 200, 100));
textView.layer.borderWidth = 1;
textView.layer.borderColor = UIColor.grayColor().CGColor;
textView;


//是否可编辑
textView.editable = false;
textView.selectable = false;

//字体，颜色，对齐方式
textView.text = "你好，我是TextView http//:www.baidu.com";
textView.font = UIFont.systemFontOfSize(16);
textView.textColor = UIColor.blackColor();
textView.textAlignment = .Right;

//连接方式
textView.dataDetectorTypes = .All;

//自定义选择菜单后的内容
let main = UIMenuItem(title: "邮件", action: "onMail");
let weixin = UIMenuItem(title: "微信", action: "onWeiXin");
let menu = UIMenuController();
menu.menuItems = [main, weixin];





