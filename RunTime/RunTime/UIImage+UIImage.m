//
//  UIImage+UIImage.m
//  RunTime
//
//  Created by 赵博 on 2017/6/20.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "UIImage+UIImage.h"
#import <objc/message.h>
@implementation UIImage (UIImage)
//加载这个分类的时候调用
+ (void)load{
    NSLog(@"%s",__func__);
    
    //获取类方法
    //IMP:方法实现
    //Class:那个类
    //SEL:方法编号
    
    Method imageNameMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method customNameMethod = class_getClassMethod([UIImage class], @selector(custom_imageNamed:));

    
    //获取对象方法
//    class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    //交换方法实现
    method_exchangeImplementations(imageNameMethod, customNameMethod);
}

//运行时
//先写一个其他办法
+ (UIImage *)custom_imageNamed:(NSString *)name{
    //1.加载图片
    UIImage *image = [UIImage custom_imageNamed:name];
    //2.是否成功
    if (image == nil) {
        NSLog(@"加载为空");
    }
    return image;
}

//在分类里面不能调用super，因为没父类
//+ (UIImage *)imageNamed:(NSString *)name{
//    [super ima]
//}
@end
