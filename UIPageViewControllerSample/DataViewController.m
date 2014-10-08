//
//  DataViewController.m
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy年 MM月";
    self.dataLabel.text = [dateFormatter stringFromDate:self.date];
}

@end
