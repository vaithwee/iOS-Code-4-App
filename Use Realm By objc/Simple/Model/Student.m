//
//  Student.m
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "Student.h"

@implementation Student
- (NSString *)sexString
{
    return !self.sex?@"Male":@"Female";
}

- (NSString *)birthdayString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy年MM月dd日"];
    return [formatter stringFromDate:self.birthday];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"name":@"unknown",@"sex":@(0)};
}

+ (NSArray<NSString *> *)requiredProperties
{
    return @[@"name"];
}
@end
