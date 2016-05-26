//
//  Transition.m
//  模仿pop弹出
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "Transition.h"
#import "ViewController.h"
#import "ViewController2.h"


@interface Transition()
@property(assign,nonatomic) presentType type;


@property(strong,nonatomic) UIView  *tempview;

@end

@implementation Transition

+ (instancetype)TransitionWithType:(presentType )type{
    return  [[self alloc] initWithPresentType:type];
}
- (instancetype)initWithPresentType:(presentType)type{
    self =  [super init];
    if(self){
        _type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return _type?.5f:.25f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContex{
    if(self.type == present){
        [self presentWithTransitionContext:transitionContex];
    }else{
[self dismissWithTransitionContext:transitionContex];
    }


}

- (void)presentWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1
    ViewController *fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController2 *tovc = [transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];


    //2
    UIView *containerview = [transitionContext containerView];


    //3
    self.tempview = [fromvc.view snapshotViewAfterScreenUpdates:NO];
    self.tempview.frame = fromvc.view.bounds;
    fromvc.view.hidden = YES;

    [containerview addSubview:self.tempview];
    [containerview addSubview:tovc.view];

    tovc.view.frame = CGRectMake(0, containerview.frame.size.height, containerview.frame.size.width, 400);

    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        self.tempview.transform = CGAffineTransformMakeScale(.85f, .85f);
        tovc.view.transform = CGAffineTransformMakeTranslation(0, -400);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
         fromvc.view.hidden = NO;
    }];
    

}
- (void)dismissWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1
     ViewController2 *fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    //2
    UIView *containerView = [transitionContext containerView];


    //3
    [containerView addSubview:fromvc.view];

     NSArray *subviewsArray = containerView.subviews;
    UIView *tempView = [subviewsArray firstObject];

    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        fromvc.view .transform = CGAffineTransformMakeTranslation(0, 400);
        tempView .transform = CGAffineTransformIdentity;


    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];

    }];
}
@end
