//
//  ViewController.m
//  RunTime
//
//  Created by 赵博 on 2017/6/20.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#warning 第一步:运行时导入
#import <objc/message.h>

#import "UIImage+UIImage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //发送消息
    
    Person *p = [[Person alloc] init];
    //吃东西
//    [p eat];
    //OC：运行时机制
    //消息机制：任何方法调用，本质都是发送消息
    //SEL：方法编号,根据方法编号可以找到他
    
//    [p performSelector:@selector(eat)];
    //运行时,发送消息,谁做事情就是
    //Xcode5之后，苹果不建议使用底层方法
#warning 第二步build setting ->msg ->No
    //Xcode5之后
    //让p发送消息
//    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, @selector(run:),10);
    
    //类调用,本质类名转换成类对象
//    [Person eat];
    Class personClass =  [Person class];
    
//    [personClass performSelector:@selector(eat)];
    
    //运行时
    objc_msgSend(personClass, @selector(eat));
   
    
    
    //交换方法
//    UIImage *image = [UIImage imageNamed:@"123"];
    //imageNamed加载图片，并不知道是否加载成功
    //1.每次使用都需要导入头文件
    //2.当一个项目开发太久，这种方法不靠谱
//    [UIImage custom_imageNamed:@"123"];
    
    //1.imageNamed:底层custom_imageNamed
    //本质 交换2个方法的实现
    [UIImage imageNamed:@"123"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
