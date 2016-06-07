//
//  Dog.h
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "RLMObject.h"

@class Person;
@interface Dog : RLMObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (strong, nonatomic) Person *owner;
@end

RLM_ARRAY_TYPE(Dog)