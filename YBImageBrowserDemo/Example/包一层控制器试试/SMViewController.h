//
//  SMViewController.h
//  YBImageBrowserDemo
//
//  Created by Mr.hu on 31/07/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "YBImageBrowser.h"
#import "YBIBVideoData.h"
#import "YBIBUtilities.h"

#import "UIViewController+Transtion.h"

@protocol SMViewControllerDelegate <NSObject>

@optional

- (void)cc_imageBrowser:(YBImageBrowser *_Nullable)imageBrowser pageChanged:(NSInteger)page data:(id<YBIBDataProtocol>_Nullable)data;

- (void)cc_imageBrowser:(YBImageBrowser *_Nullable)imageBrowser respondsToLongPressWithData:(id<YBIBDataProtocol>_Nullable)data;

- (void) closeImageBrowser:(YBImageBrowser *_Nullable)imageBrowser index:(NSInteger)index data:(id<YBIBDataProtocol>_Nullable)data;

@end

@interface SMViewController : UIViewController

@property (nonatomic, copy) NSArray<PHAsset *> * _Nonnull imagePHAssets;

// 数据源数组
@property (nonatomic, copy) NSArray<id<YBIBDataProtocol>> * _Nullable dataSourceArray;
// 当前页码
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic , weak) id<SMViewControllerDelegate> _Nullable delegate;

@property (nonatomic , strong , nullable)    UIView * presentingImageView;

@end

