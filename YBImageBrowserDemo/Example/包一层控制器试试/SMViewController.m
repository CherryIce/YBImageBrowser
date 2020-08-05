//
//  SMViewController.m
//  YBImageBrowserDemo
//
//  Created by Mr.hu on 31/07/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController ()<YBImageBrowserDelegate>

@end

@implementation SMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     用控制器包装处理起来有些麻烦 而且效果好像不太理想
     */
    
    YBImageBrowser *browser = [YBImageBrowser new];
    // 禁止旋转（但是若当前控制器能旋转，图片浏览器也会跟随，布局可能会错位，这种情况还待处理）
    browser.supportedOrientations = UIInterfaceOrientationMaskPortrait;
    //
    browser.delegate = self;
    browser.dataSourceArray = self.dataSourceArray;
    browser.currentPage = self.currentPage;
    // 关闭入场和出场动效
    browser.defaultAnimatedTransition.showType = YBIBTransitionTypeNone;
    browser.defaultAnimatedTransition.hideType = YBIBTransitionTypeNone;
    // 删除工具视图（你可能需要自定义的工具视图，那请自己实现吧）
    browser.toolViewHandlers = @[];
    // 由于 self.view 的大小可能会变化，所以需要显式的赋值容器大小
    CGSize size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - YBIBStatusbarHeight() - 44);
    [browser showToView:self.view containerSize:size];
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(browser) weakBrowser = browser;
    browser.hideBlock = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(closeImageBrowser:index:data:)]) {
            [weakSelf.delegate closeImageBrowser:weakBrowser index:weakBrowser.currentPage data:weakBrowser.dataSourceArray[weakBrowser.currentPage]];
        }
        //[weakSelf dismissViewControllerAnimated:NO completion:nil];
        [weakSelf dismissSMViewControllerAnimated:YES completion:^{
            
        }];
    };
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark -- YBImageBrowserDelegate
- (void)yb_imageBrowser:(YBImageBrowser *)imageBrowser pageChanged:(NSInteger)page data:(id<YBIBDataProtocol>)data {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cc_imageBrowser:pageChanged:data:)]) {
        [self.delegate cc_imageBrowser:imageBrowser pageChanged:page data:data];
    }
}

- (void)yb_imageBrowser:(YBImageBrowser *)imageBrowser respondsToLongPressWithData:(id<YBIBDataProtocol>)data {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cc_imageBrowser:respondsToLongPressWithData:)]) {
        [self.delegate cc_imageBrowser:imageBrowser respondsToLongPressWithData:data];
    }
}

- (void)yb_imageBrowser:(YBImageBrowser *)imageBrowser beginTransitioningWithIsShow:(BOOL)isShow {}

- (void)yb_imageBrowser:(YBImageBrowser *)imageBrowser endTransitioningWithIsShow:(BOOL)isShow {}

@end

