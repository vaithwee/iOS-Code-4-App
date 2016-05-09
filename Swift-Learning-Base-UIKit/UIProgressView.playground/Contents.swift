//: Playground - noun: a place where people can play

import UIKit

var progressView = UIProgressView(progressViewStyle: .Default);
progressView.progress = 0.5;

//设置进度，同时又动画效果
progressView.setProgress(0.8, animated: true);

//改变进度条颜色
progressView.progressTintColor = UIColor.greenColor();
progressView.trackTintColor = UIColor.redColor();

