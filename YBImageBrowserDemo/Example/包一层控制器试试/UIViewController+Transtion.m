//
//  UIViewController+Transtion.m
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import "UIViewController+Transtion.h"

#import "SMPresentTransition.h"
#import "SMDismissTransition.h"

@implementation UIViewController (Transtion)

- (void)presentSMViewController:(UIViewController *_Nullable)controller
                      animated:(BOOL)animated
                     completion:(void (^_Nullable)(void))completion{
    controller.transitioningDelegate = self;
    controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:controller animated:animated completion:completion];
}


- (void)dismissSMViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [self dismissViewControllerAnimated:flag completion:completion];
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    SMPresentTransition * p = [SMPresentTransition new];
    return p;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    SMDismissTransition * d = [SMDismissTransition new];
    return d;
}

@end
