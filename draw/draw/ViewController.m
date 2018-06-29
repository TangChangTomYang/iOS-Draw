//
//  ViewController.m
//  draw
//
//  Created by yangrui on 2018/6/28.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "YRDrawView.h"

@interface ViewController ()

@property (strong, nonatomic) YRDrawView *drawView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CGFloat y = 100;
    CGRect frame = CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - 2.0 * y);
    self.drawView = [[YRDrawView alloc]initWithFrame:frame];
    [self.view addSubview:self.drawView]; 
}


@end
