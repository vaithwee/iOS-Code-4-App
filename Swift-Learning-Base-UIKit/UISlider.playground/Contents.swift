//: Playground - noun: a place where people can play

import UIKit
[#Image(imageLiteral: "plus.png")#]
[#Image(imageLiteral: "reduce.png")#]
let slider = UISlider(frame: CGRectMake(0,0,300,50));
slider.maximumValue = 1;
slider.minimumValue = 0;
slider.value = 0.5;


//设置滑块的值，同时又动画
slider.setValue(0.8, animated: true);


//滑块值改变响音
slider.continuous = false; //滑块停止后才ValueChanged时间
slider.addTarget(nil, action: Selector("valueChanged"), forControlEvents: .ValueChanged);

//滑块左右的颜色
slider.maximumTrackTintColor = UIColor.redColor();
slider.minimumTrackTintColor = UIColor.greenColor();

//左右两边图片
slider.minimumValueImage = UIImage(named: "reduce");
slider.maximumValueImage = UIImage(named: "plus");

//滑块图片
slider.setThumbImage(UIImage(named: "reduce"), forState: .Normal);

