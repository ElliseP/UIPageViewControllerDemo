//
//  UIColor+Random.m
//  UIPageViewControllerDemo
//
//  Created by Ellise on 2017/1/30.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor{
    CGFloat hue = (arc4random() %256/256.0);
    
    CGFloat saturation = (arc4random() %128/256.0) +0.5;
    
    CGFloat brightness = (arc4random() %128/256.0) +0.5;
    
    UIColor * color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
    

}

@end
