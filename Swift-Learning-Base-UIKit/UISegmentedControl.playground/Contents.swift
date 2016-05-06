//: Playground - noun: a place where people can play

import UIKit


[#Image(imageLiteral: "star.png")#]
let items:[AnyObject] = ["选项1", "选项2", UIImage(named: "star")!];
let segmented = UISegmentedControl(items: items);
segmented.center = CGPointZero;
segmented.selectedSegmentIndex = 1;

segmented.addTarget(nil, action: Selector("method"), forControlEvents: .ValueChanged);

//添加选项和删除选项
segmented.insertSegmentWithTitle("新增选项", atIndex: 1, animated: true);

segmented.insertSegmentWithImage(UIImage(named: "star")!, atIndex: 1, animated: true);

segmented.removeSegmentAtIndex(1, animated: true);

//颜色

segmented.tintColor = UIColor.redColor();

segmented.setContentOffset(CGSizeMake(20, 10), forSegmentAtIndex: 1);

