//
//  ViewController.m
//  模仿pop弹出
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = YES;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2 *v2 = [ViewController2 new];


    [self presentViewController:v2 animated:YES completion:^{

        
    }];
}
#pragma mark - ViewControler2Delegate


@end
