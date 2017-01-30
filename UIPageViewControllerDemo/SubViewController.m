//
//  SubViewController.m
//  UIPageViewControllerDemo
//
//  Created by Ellise on 2017/1/30.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import "SubViewController.h"
#import "UIColor+Random.h"

@interface SubViewController ()

@property (nonatomic,strong) UILabel * contentLabel;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor randomColor];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width/2, 100)];
    _contentLabel.numberOfLines = 0;
    _contentLabel.text = self.contentString;
    _contentLabel.backgroundColor = [UIColor randomColor];
    _contentLabel.clipsToBounds = YES;
    [self.view addSubview:_contentLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
