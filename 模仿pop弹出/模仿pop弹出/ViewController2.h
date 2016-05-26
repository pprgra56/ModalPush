//
//  ViewController2.h
//  模仿pop弹出
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControler2Delegate <NSObject>

- (void)lifeOrDead;
@end


@interface ViewController2 : UIViewController<UIViewControllerTransitioningDelegate>


@property(assign,nonatomic) id <ViewControler2Delegate> delegate;
@end
