//
//  ModelController.h
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  PageViewControllerのデータソース
 */
@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (UIViewController *)startingViewController;

- (void)setCurrentViewController:(UIViewController *)currentViewController;

@end

