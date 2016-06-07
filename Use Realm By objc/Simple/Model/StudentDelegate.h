//
//  StudentDelegate.h
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//
@class Student;

@protocol StudentDelegate <NSObject>

@optional
- (void)didAddStudent;
- (void)didEditAndUpdateWithStudent:(Student *)student;

@end