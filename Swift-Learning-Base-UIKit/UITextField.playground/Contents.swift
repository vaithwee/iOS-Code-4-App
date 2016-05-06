//: Playground - noun: a place where people can play

import UIKit

//创建文本框，设置样式
let textField = UITextField(frame: CGRectMake(0,0,200,40));
textField.borderStyle = .RoundedRect;

//文本框提示文字
textField.placeholder = "请输入用户名";

//文字大小超过文本框长度时，自动输小字号，而不是省略号
textField.adjustsFontSizeToFitWidth = true;
textField.minimumFontSize = 14;
textField.text = "文字大小"

//水平/垂直对齐方式
textField.textAlignment = .Right;
textField.contentVerticalAlignment = .Top;
[#Image(imageLiteral: "icon.png")#]

//背景图片设置
textField.borderStyle = .None;
textField.background = UIImage(named: "icon");

//清除按钮
textField.clearButtonMode = .WhileEditing;

//设置文本框关联的键盘类型
textField.keyboardType = .NumberPad;

//使文本框获取焦点
textField.becomeFirstResponder();

//失去焦点 
textField.resignFirstResponder();

//设置键盘的return样式
textField.returnKeyType = .Done;


