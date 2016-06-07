//
//  AddStudentViewController.h
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentDelegate.h"
#import "Student.h"


@interface AddOrEditStudentViewController : UITableViewController
@property (weak, nonatomic) id<StudentDelegate> delegate;
@property (strong, nonatomic) Student *student;
@end
