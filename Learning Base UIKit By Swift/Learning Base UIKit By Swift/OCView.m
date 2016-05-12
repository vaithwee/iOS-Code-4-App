//
//  OCView.m
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "OCView.h"

@implementation OCView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor redColor]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift"]];
        [self addSubview:imageView];
        [imageView setCenter:self.center];
    }
    return self;
}

@end
