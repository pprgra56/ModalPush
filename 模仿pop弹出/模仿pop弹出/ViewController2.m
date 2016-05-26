//
//  ViewController2.m
//  模仿pop弹出
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController2.h"
#import "Transition.h"

@interface ViewController2()

@end

@implementation ViewController2

-(void)viewDidLoad{
    [super viewDidLoad];
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.view.backgroundColor = [UIColor yellowColor];

    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = YES;


    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, 100, 33)];
    [text setText:@"click Me"];
    [self.view addSubview:text];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [Transition TransitionWithType:present];

}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismisse{
    return [Transition TransitionWithType:dismiss];
}
@end
