//
//  DataViewController.h
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  PageViewController上の１ページを表すViewController
 */
@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;

@property (strong, nonatomic) NSDate *date;

@end

