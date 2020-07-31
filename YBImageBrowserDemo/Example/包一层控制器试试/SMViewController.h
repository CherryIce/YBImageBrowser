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

@protocol SMViewControllerDelegate <NSObject>

@optional

- (void)cc_imageBrowser:(YBImageBrowser *_Nullable)imageBrowser pageChanged:(NSInteger)page data:(id<YBIBDataProtocol>_Nullable)data;

- (void)cc_imageBrowser:(YBImageBrowser *_Nullable)imageBrowser respondsToLongPressWithData:(id<YBIBDataProtocol>_Nullable)data;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SMViewController : UIViewController

@property (nonatomic, copy) NSArray<PHAsset *> *imagePHAssets;

// 数据源数组
@property (nonatomic, copy) NSArray<id<YBIBDataProtocol>> *dataSourceArray;
// 当前页码
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic , weak) id<SMViewControllerDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
