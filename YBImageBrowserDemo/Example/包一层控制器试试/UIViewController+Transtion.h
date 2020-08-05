//
//  UIViewController+Transtion.h
//  YBImageBrowserDemo
//
//  Created by Mr.Zhu on 05/08/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Transtion)<UIViewControllerTransitioningDelegate>

/**
 *  For presenting SMViewController.
 *
 *  @param controller your created SMViewController
 *  @param animated          animated or nonanimated
 *  @param completion        complitionBlock
 */
-(void)presentSMViewController:(UIViewController*_Nullable)controller
                         animated:(BOOL)animated
                       completion:(void (^_Nullable)(void))completion;
/**
 *  For dismissing SMViewController
 *
 *  @param animated   animated      animated
 *  @param completion       complitionBlock
 */
- (void)dismissSMViewControllerAnimated:(BOOL)animated
                           completion:(void (^_Nonnull)(void))completion;

@end

NS_ASSUME_NONNULL_END
