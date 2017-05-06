//
//  CFSegmentBar.h
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFSegmentBarConfig.h"
@class CFSegmentBar;
@protocol CFSegmentBarDelegate <NSObject>

- (void)segmentBar:(CFSegmentBar *)bar didSelectedItemsToIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex;

@end
@interface CFSegmentBar : UIView
/** 标题数组 */
@property(nonatomic, strong)  NSArray<NSString *> *items;
/** 按钮点击事件代理 */
@property(nonatomic, weak) id<CFSegmentBarDelegate> delegate;
/** 被选中的按钮索引,必须先设置 items 数组之后才能设置此属性*/
@property(nonatomic, assign) NSInteger selectedIndex;

/**
 快速创建segmentBar

 @param frame frame
 @return segmentBar对象
 */
+ (instancetype)segmentBarWithFrame:(CGRect)frame;
- (void)updateWithConfig:(void(^)(CFSegmentBarConfig *))config;
@end
