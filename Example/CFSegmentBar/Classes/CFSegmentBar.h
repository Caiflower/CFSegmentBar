//
//  CFSegmentBar.h
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
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
+ (instancetype)segmentBarWithFrame:(CGRect)frame;
@end
