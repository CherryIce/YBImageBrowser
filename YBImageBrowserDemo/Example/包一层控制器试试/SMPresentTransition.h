//
//  SMPresentTransition.h
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMPresentTransition : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, strong) UIImageView * presentingImageView;

@end

NS_ASSUME_NONNULL_END
