//
//  SMPresentTransition.m
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import "SMPresentTransition.h"

#import "SMViewController.h"

@implementation SMPresentTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    SMViewController *toViewController = (SMViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    self.presentingImageView = [[UIImageView alloc] initWithFrame:[containerView convertRect:toViewController.presentingImageView.frame fromView:toViewController.presentingImageView.superview]];
    
    if ([toViewController.presentingImageView isKindOfClass:[UIImageView class]]) {
        UIImageView * imageV = (UIImageView *)toViewController.presentingImageView;
        if (imageV.image) {
            self.presentingImageView.image = imageV.image;
        }else{
            self.presentingImageView.image = YBIBSnapshotView(toViewController.presentingImageView);
        }
    }
    self.presentingImageView.clipsToBounds = toViewController.presentingImageView.clipsToBounds;
    self.presentingImageView.layer.cornerRadius = toViewController.presentingImageView.layer.cornerRadius;
    
    [containerView addSubview:self.presentingImageView];
    [containerView addSubview:toViewController.view];
    
    toViewController.presentingImageView.hidden = YES;
    //添加目标控制器view
    toViewController.view.alpha = 0;
    [containerView addSubview:toViewController.view];
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1;
    }];
    
    //添加imageView
    [containerView addSubview:self.presentingImageView];
    
    CGFloat imageOriginalWidth = self.presentingImageView.image.size.width;
    CGFloat imageOriginalHeight = self.presentingImageView.image.size.height;
    CGFloat imageWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat imageHeight = imageOriginalHeight / imageOriginalWidth * imageWidth;
    CGFloat imageY = ([UIScreen mainScreen].bounds.size.height - imageHeight) * 0.5;
    imageY = imageY < 0 ? 0 : imageY;
    CGRect toValue = CGRectMake(0, imageY, imageWidth, imageHeight);
    
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.presentingImageView.alpha = 0;
        self.presentingImageView.frame = toValue;
    } completion:^(BOOL finished) {
        self.presentingImageView.hidden = NO;
        [self.presentingImageView removeFromSuperview];
        toViewController.presentingImageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
    
//    POPSpringAnimation *imageMove = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
//    imageMove.fromValue = [NSValue valueWithCGRect:CGRectMake(self.presentingImageView.frame.origin.x, self.presentingImageView.frame.origin.y, self.presentingImageView.frame.size.width, self.presentingImageView.frame.size.height)];
    //计算图片浏览器中image的frame
//    CGFloat imageOriginalWidth = self.presentingImageView.image.size.width;
//    CGFloat imageOriginalHeight = self.presentingImageView.image.size.height;
//    CGFloat imageWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat imageHeight = imageOriginalHeight / imageOriginalWidth * imageWidth;
//    CGFloat imageY = ([UIScreen mainScreen].bounds.size.height - imageHeight) * 0.5;
//    imageY = imageY < 0 ? 0 : imageY;
//    imageMove.toValue = [NSValue valueWithCGRect:CGRectMake(0, imageY, imageWidth, imageHeight)];
//    imageMove.beginTime = CACurrentMediaTime();
//    imageMove.springBounciness = 4.0;
//    imageMove.springSpeed = 10.0;
//    imageMove.completionBlock = ^(POPAnimation *anim ,BOOL isEnd){
//
//        self.presentingImageView.hidden = YES;
//        [self.presentingImageView removeFromSuperview];
//        toViewController.presentingImageView.hidden = NO;
//        [toViewController prepareLoad];
//        [transitionContext completeTransition:YES];
//    };
//    [self.presentingImageView pop_addAnimation:imageMove forKey:nil];
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
