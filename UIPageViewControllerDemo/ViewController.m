//
//  ViewController.m
//  UIPageViewControllerDemo
//
//  Created by Ellise on 2017/1/30.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface ViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController * pageViewController;

@property (nonatomic,strong) NSArray * pageContentArray;

@end

@implementation ViewController

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SubViewController * subViewController0 = [self viewControllerAtIndex:0];
    SubViewController * subViewController1 = [self viewControllerAtIndex:1];
    NSArray * pageArray = [NSArray arrayWithObjects:subViewController0, subViewController1 ,nil];
    
    [self.pageViewController setViewControllers:pageArray direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    self.pageViewController.view.frame = self.view.bounds;
    //self.pageViewController.view.clipsToBounds = NO;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [self indexOfViewController:(SubViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageContentArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(SubViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    
    return [self viewControllerAtIndex:index];
}

#pragma mark UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    NSLog(@"start page");
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    NSLog(@"end page");
}

#pragma mark private method

- (SubViewController *)viewControllerAtIndex:(NSInteger)index{
    if (self.pageContentArray.count == 0 || index >= self.pageContentArray.count) {
        return nil;
    }
    
    SubViewController * subViewController = [[SubViewController alloc] init];
    subViewController.contentString = [self.pageContentArray objectAtIndex:index];
    
    return subViewController;
}

- (NSUInteger)indexOfViewController:(SubViewController *)viewController {
    return [self.pageContentArray indexOfObject:viewController.contentString];
}

#pragma mark getters and setters

- (NSArray *)pageContentArray{
    if (!_pageContentArray) {
        NSMutableArray * muArr = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i<6; i++) {
            NSString * s = [NSString stringWithFormat:@"page %ld",(long)i];
            [muArr addObject:s];
        }
        _pageContentArray = [[NSArray alloc] initWithArray:muArr];
    }
    return _pageContentArray;
}

- (UIPageViewController *)pageViewController{
    if (!_pageViewController) {
        //书脊翻页模式，定义书脊位置
        NSDictionary * options = @{UIPageViewControllerOptionSpineLocationKey:@(UIPageViewControllerSpineLocationMid)};
        //滑动翻页模式，定义页面间距
        //NSDictionary * options = @{UIPageViewControllerOptionInterPageSpacingKey:@(20)};

        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
       // _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        
        _pageViewController.dataSource = self;
        _pageViewController.delegate = self;
        _pageViewController.doubleSided = YES;
    }
    return _pageViewController;
}

@end
