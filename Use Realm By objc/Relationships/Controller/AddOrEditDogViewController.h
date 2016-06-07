//
//  AddOrEditDogViewController.h
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/3.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RelationshipsDelegate.h"
#import "Dog.h"

@interface AddOrEditDogViewController : UITableViewController
@property (weak, nonatomic) id<RelationshipsDelegate> delegate;
@property (strong, nonatomic) Dog *dog;
@end
