//
//  CFSegmentBarConfig.m
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import "CFSegmentBarConfig.h"

@implementation CFSegmentBarConfig
+ (instancetype)defaultConfig
{
    CFSegmentBarConfig * config = [[CFSegmentBarConfig alloc] init];
    /** 标题普通状态颜色 */
    config.titleColor = [UIColor blackColor];
    /** 标题选中状态颜色 */
    config.selectedColor = [UIColor redColor];
    /** 标题字体 */
    config.titleFont = [UIFont systemFontOfSize:15];
    /** 指示器颜色 */
    config.indicatorColor = [UIColor redColor];
    /** 指示器高度 */
    config.indicatorHeight = 3;
    /** 指示器额外宽度 */
    config.indicatorExtraWidth = 5;
    
    return config;
}
@end
