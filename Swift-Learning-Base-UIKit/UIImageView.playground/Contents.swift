//: Playground - noun: a place where people can play

import UIKit
[#Image(imageLiteral: "star.png")#];[#Image(imageLiteral: "logo.png")#]
let imageView = UIImageView(image: UIImage(named: "star"));
imageView.frame = CGRectMake(0, 0, 100, 100);

let path = NSBundle.mainBundle().pathForResource("logo", ofType: "png");
let newImage = UIImage(contentsOfFile: path!);
imageView.image = newImage;

let url = NSURL(string: "http://hangge.com/blog/images/logo.png")
let data = NSData(contentsOfURL: url!);
let logo = UIImageView(image: UIImage(data: data!));

/*
imageView=UIImageView()
imageView.frame=CGRectMake(10,10,100,100)
//设置动画图片
imageView.animationImages=[UIImage(named:"icon")!,UIImage(named:"icon2")!]
//设置每隔0.5秒变化一次
imageView.animationDuration=0.5
*/
