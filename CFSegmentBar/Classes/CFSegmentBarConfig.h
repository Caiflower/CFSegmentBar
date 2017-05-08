//
//  CFSegmentBarConfig.h
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFSegmentBarConfig : NSObject
/** 标题普通状态颜色 */
@property(nonatomic, strong)  UIColor * titleColor;
/** 标题选中状态颜色 */
@property(nonatomic, strong)  UIColor *  selectedColor;
/** 标题字体 */
@property(nonatomic, strong)  UIFont *  titleFont;
/** 指示器颜色 */
@property(nonatomic, strong)  UIColor *  indicatorColor;
/** 指示器高度 */
@property(nonatomic, assign)  CGFloat indicatorHeight;
/** 指示器额外宽度 */
@property(nonatomic, assign)  CGFloat indicatorExtraWidth;
+ (instancetype)defaultConfig;
@end
