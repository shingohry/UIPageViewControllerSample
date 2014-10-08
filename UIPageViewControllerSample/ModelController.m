//
//  ModelController.m
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@interface ModelController ()

@property (strong, nonatomic) NSDate *previousMonth;

@property (strong, nonatomic) NSDate *currentMonth;

@property (strong, nonatomic) NSDate *followingMonth;

@end

@implementation ModelController

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentMonth = [NSDate date];
    }
    return self;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    return [self viewControllerWithDate:self.previousMonth];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    return [self viewControllerWithDate:self.followingMonth];
}

#pragma mark - Public

- (void)setCurrentViewController:(DataViewController *)currentViewController
{
    self.currentMonth = currentViewController.date;
}

- (DataViewController *)startingViewController
{
    return [self viewControllerWithDate:self.currentMonth];
}

#pragma mark - Private

- (void)setCurrentMonth:(NSDate *)currentMonth
{
    _currentMonth = currentMonth;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 1ヶ月前
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = -1;
    self.previousMonth = [calendar dateByAddingComponents:dateComponents toDate:_currentMonth options:0];
    
    // 1ヶ月後
    dateComponents.month = 1;
    self.followingMonth = [calendar dateByAddingComponents:dateComponents toDate:_currentMonth options:0];
}

- (DataViewController *)viewControllerWithDate:(NSDate *)date
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:[NSBundle mainBundle]];
    DataViewController *dataViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.date = date;
    
    return dataViewController;
}

@end
