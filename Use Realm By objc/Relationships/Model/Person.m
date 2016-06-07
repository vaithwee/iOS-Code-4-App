//
//  Person.m
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
{
    return @{
             @"dogs":[RLMPropertyDescriptor descriptorWithClass:Dog.class propertyName:@"owner"]
             };
}
@end
