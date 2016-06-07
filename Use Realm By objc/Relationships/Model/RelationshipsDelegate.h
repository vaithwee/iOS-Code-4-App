//
//  RelationshipsDelegate.h
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/3.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

@protocol RelationshipsDelegate <NSObject>

@optional
- (void)didAddPerson;
- (void)didEditPerson;
- (void)didAddDog;
- (void)didEditDog;
@end