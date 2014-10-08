//
//  RootViewController.h
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  ルート画面を表すViewController
 */
@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

