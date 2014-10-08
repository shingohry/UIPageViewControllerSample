//
//  TableViewController.m
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/09.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %ld日", self.title, (long)(indexPath.row + 1)];
    
    return cell;
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy年 MM月";
    self.title = [dateFormatter stringFromDate:self.date];
}

@end
