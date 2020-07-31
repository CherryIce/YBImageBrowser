//
//  TestGViewController.m
//  YBImageBrowserDemo
//
//  Created by Mr.hu on 31/07/2020.
//  Copyright © 2020 杨波. All rights reserved.
//

#import "TestGViewController.h"
#import "SMViewController.h"
#import "YBIBPhotoAlbumManager.h"

@interface TestGViewController ()

@end

@implementation TestGViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [YBIBPhotoAlbumManager getPhotoAlbumAuthorizationSuccess:^{
            self.dataArray = [BaseFileManager imagePHAssets];
        } failed:^{}];
    }
    return self;
}

+ (NSString *)yb_title {
    return @"包一层控制器试试（以相册为例）";
}

#pragma mark - override

- (void)selectedIndex:(NSInteger)index {
    NSArray * datas = [self gainArray];
    //使用控制器保证的图片浏览器
    SMViewController *browser = [SMViewController new];
    browser.dataSourceArray = datas;
    browser.currentPage = index;
    [self presentViewController:browser animated:YES completion:nil];
}

- (NSArray *) gainArray {
    NSMutableArray * array = [NSMutableArray array];
    for (PHAsset *asset in self.dataArray) {
        if (asset.mediaType == PHAssetMediaTypeVideo) {
            // 系统相册的视频
            YBIBVideoData *data = [YBIBVideoData new];
            data.videoPHAsset = asset;
            [array addObject:data];
        } else if (asset.mediaType == PHAssetMediaTypeImage) {

            // 系统相册的图片
            YBIBImageData *data = [YBIBImageData new];
            data.imagePHAsset = asset;
            [array addObject:data];
        }
    }
    return array.copy;
}

@end
