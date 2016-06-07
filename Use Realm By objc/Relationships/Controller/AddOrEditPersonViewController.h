//
//  AddOrEditPersonViewController.h
//  Use Realm By objc
//
//  Created by Vaith on 16/6/3.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RelationshipsDelegate.h"
#import "Person.h"

@interface AddOrEditPersonViewController : UITableViewController
@property (weak, nonatomic) id<RelationshipsDelegate> delegate;
@property (strong, nonatomic) Person *person;
@end
