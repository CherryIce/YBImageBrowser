//
//  SMDismissTransition.h
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMDismissTransition : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end

NS_ASSUME_NONNULL_END
