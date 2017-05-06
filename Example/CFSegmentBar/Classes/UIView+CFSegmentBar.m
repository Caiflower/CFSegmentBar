//
//  UIView+CFSegmentBar.m
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import "UIView+CFSegmentBar.h"

@implementation UIView (CFSegmentBar)
- (CGFloat)cf_centerX {
    
    return self.center.x;
}

- (void)setCf_centerX:(CGFloat)cf_centerX {
    
    CGPoint center = self.center;
    center.x = cf_centerX;
    self.center = center;
}

- (CGFloat)cf_centerY {
    return self.center.y;
}
- (void)setCf_centerY:(CGFloat)cf_centerY {
    
    CGPoint center = self.center;
    center.y = cf_centerY;
    self.center = center;
}

- (CGFloat)cf_height {
    
    return self.frame.size.height;
}

- (void)setCf_height:(CGFloat)cf_height {
    
    CGRect rect = self.frame;
    rect.size.height = cf_height;
    self.frame = rect;
}

- (CGFloat)cf_width {
    
    return self.frame.size.width;
}

- (void)setCf_width:(CGFloat)cf_width {
    
    CGRect rect = self.frame;
    rect.size.width = cf_width;
    self.frame = rect;
}

- (CGFloat)cf_x {
    
    return self.frame.origin.x;
}

- (void)setCf_x:(CGFloat)cf_x {
    
    CGRect rect = self.frame;
    rect.origin.x = cf_x;
    self.frame = rect;
    
}

- (CGFloat)cf_y {
    
    return self.frame.origin.y;
}

- (void)setCf_y:(CGFloat)cf_y
{
    CGRect rect = self.frame;
    rect.origin.y = cf_y;
    self.frame = rect;
}

@end
