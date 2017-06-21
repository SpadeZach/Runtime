//
//  Person.m
//  RunTime
//
//  Created by 赵博 on 2017/6/20.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)eat{
    NSLog(@"对象方法");
}
+ (void)eat{
    NSLog(@"类方法");
}
- (void)run:(NSInteger)meter{
    NSLog(@"跑了%ld米",meter);
}
@end
