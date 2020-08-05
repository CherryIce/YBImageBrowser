//
//  SMDismissTransition.m
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import "SMDismissTransition.h"

#import "SMViewController.h"

@implementation SMDismissTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    
    //获取源控制器 注意不要写成 UITransitionContextFromViewKey
    SMViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [containerView addSubview:fromVc.view];
    
    //要消失的vc
    fromVc.view.alpha = 1;
    [containerView addSubview:fromVc.view];
    [UIView animateWithDuration:duration animations:^{
        fromVc.view.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)finishInteractiveTransition {
    
}

- (void)cancelInteractiveTransition {
    
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete {
    
}

- (void)animationEnded:(BOOL)transitionCompleted {
    //动画结束
}

@end
