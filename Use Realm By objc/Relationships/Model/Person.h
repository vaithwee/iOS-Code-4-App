//
//  Person.h
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "RLMObject.h"
#import <Realm.h>

#import "Dog.h"

@interface Person : RLMObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
//@property (strong, nonatomic) RLMArray<Dog *><Dog> *dogs;
@property (readonly) RLMLinkingObjects *dogs;
@end
