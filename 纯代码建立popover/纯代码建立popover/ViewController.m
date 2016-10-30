//
//  ViewController.m
//  纯代码建立popover
//
//  Created by 夏宁 on 2016/10/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *demoButton;

@end

@implementation ViewController

/**
 1. 添加加号按钮
 2. 点击加号按钮以popover的方式`展现`一个视图控制器
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(popover:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popover:(UIButton *)sender {
    
    UIViewController *vc = [UIViewController new];
    
    vc.view.backgroundColor = [UIColor redColor];
    
    // 1. 在 iPhone 上默认是模态展现，设置展现类型为 popover
    vc.modalPresentationStyle = UIModalPresentationPopover;
    
    // 设置弹窗视图控制器视图的大小
    vc.preferredContentSize = CGSizeMake(0, 120);
    
    // 2. 设置展现的代理
    vc.popoverPresentationController.delegate = self;
    
    // 3. 指定弹窗的定位控件 - 使用代码开发，必须设置定位控件
    vc.popoverPresentationController.sourceView = sender;
    
    // 4. 设置箭头方向朝上
    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    
    // 5. 设置箭头的位置，原点可以参照某一个控件的尺寸设置，宽高通常用于设置附加的偏移量，通常传入0即可
    CGSize size = sender.bounds.size;
    vc.popoverPresentationController.sourceRect = CGRectMake(size.width * 0.5, size.height, 0, 0);
    
    // 6. 设置绕开控件，注意，同一时间，只能允许模态展现一个控制器
    vc.popoverPresentationController.passthroughViews = @[_demoButton];
    
    // 展现控制器
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    // 不使用系统默认的展现样式！
    return UIModalPresentationNone;
}

@end
