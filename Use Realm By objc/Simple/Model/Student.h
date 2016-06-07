//
//  Student.h
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "RLMObject.h"

@interface Student : RLMObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL sex;
@property (readonly) NSString *sexString;
@property (assign, nonatomic) NSInteger classNum;
@property (assign, nonatomic) NSInteger score;
@property (strong, nonatomic) NSDate *birthday;
@property (readonly) NSString *birthdayString;
@property NSInteger age;
@end
