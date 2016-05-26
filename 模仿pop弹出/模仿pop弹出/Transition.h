//
//  Transition.h
//  模仿pop弹出
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef enum {
    present = 0,
    dismiss
}presentType;



@interface Transition : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)TransitionWithType:(presentType )type;
@end
