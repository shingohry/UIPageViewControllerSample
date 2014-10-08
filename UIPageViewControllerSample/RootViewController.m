//
//  RootViewController.m
//  UIPageViewControllerSample
//
//  Created by 平屋真吾 on 2014/10/08.
//  Copyright (c) 2014年 平屋真吾. All rights reserved.
//

#import "RootViewController.h"
#import "ModelController.h"
//#import "DataViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (readonly, strong, nonatomic) ModelController *modelController;

@end

@implementation RootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedSegueForPageViewController"]) {
        if (!self.pageViewController) {
            self.pageViewController = segue.destinationViewController;
            self.pageViewController.delegate = self;
            
            UIViewController *startingViewController = [self.modelController startingViewController];
            NSArray *viewControllers = @[startingViewController];
            [self.pageViewController setViewControllers:viewControllers
                                              direction:UIPageViewControllerNavigationDirectionForward
                                               animated:NO
                                             completion:nil];
            self.title = startingViewController.title;
            
            self.pageViewController.dataSource = self.modelController;
            
            // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
            self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
        }
    }
}

#pragma mark -  methods

- (ModelController *)modelController
{
    // Return the model controller object, creating it if necessary.
    // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
    }
    return _modelController;
}

- (IBAction)previousButtonPressed:(id)sender
{
    __weak RootViewController *weakSelf = self;
    UIViewController *previousViewController = [self.modelController previousViewController];
    [self.pageViewController setViewControllers:@[previousViewController]
                                      direction:UIPageViewControllerNavigationDirectionReverse
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         UIViewController *currentViewController = [weakSelf.pageViewController.viewControllers lastObject];
                                         [weakSelf.modelController setCurrentViewController:currentViewController];
                                         
                                         weakSelf.title = currentViewController.title;
                                     }];
}

- (IBAction)nextButtonPressed:(id)sender
{
    __weak RootViewController *weakSelf = self;
    UIViewController *followingViewController = [self.modelController followingViewController];
    [self.pageViewController setViewControllers:@[followingViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         UIViewController *currentViewController = [weakSelf.pageViewController.viewControllers lastObject];
                                         [weakSelf.modelController setCurrentViewController:currentViewController];
                                         
                                         weakSelf.title = currentViewController.title;
                                     }];
}

#pragma mark - UIPageViewController delegate methods

/**
 spine:本のページの内側と本が棚に並べられる際に外側に来る面を囲む本のカバーの部分 http://ejje.weblio.jp/content/Spine
 */
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:nil];

    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

/**
 参考：UIPageViewController: return the current visible view http://stackoverflow.com/questions/8400870/uipageviewcontroller-return-the-current-visible-view
 */
- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    if (completed) {
        UIViewController *currentViewController = [self.pageViewController.viewControllers lastObject];
        [self.modelController setCurrentViewController:currentViewController];
        
        self.title = currentViewController.title;
    }
}

@end
