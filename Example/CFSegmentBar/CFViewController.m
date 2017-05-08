//
//  CFViewController.m
//  CFSegmentBar
//
//  Created by chriscaixx@gmail.com on 05/06/2017.
//  Copyright (c) 2017 chriscaixx@gmail.com. All rights reserved.
//

#import "CFViewController.h"
#import <CFSegmentBar/CFSegmentBar.h>
#import <CFSegmentBar/UIView+CFSegmentBar.h>


@interface CFViewController ()<CFSegmentBarDelegate>

@property(nonatomic, strong) CFSegmentBar * segmentBar;
@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CFSegmentBar * bar = [CFSegmentBar segmentBarWithFrame:CGRectMake(0, 100, self.view.cf_width, 44)];
    bar.delegate = self;
    bar.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bar];
    _segmentBar = bar;
    bar.items = @[@"推荐",@"精品",@"最新",@"推荐",@"精品",@"最新",@"推荐",@"精品",@"最新"];
    
    bar.selectedIndex = 0;
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_segmentBar updateWithConfig:^(CFSegmentBarConfig *config) {
        /** 标题普通状态颜色 */
        config.titleColor = [UIColor yellowColor];
        /** 标题选中状态颜色 */
        config.selectedColor = [UIColor greenColor];
        /** 标题字体 */
        config.titleFont = [UIFont systemFontOfSize:20];
        /** 指示器颜色 */
        config.indicatorColor = [UIColor greenColor];
        /** 指示器高度 */
        config.indicatorHeight = 10;
        /** 指示器额外宽度 */
        config.indicatorExtraWidth = 2;
    }];
}
- (void)segmentBar:(CFSegmentBar *)bar didSelectedItemsToIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%zd ---> %zd",fromIndex, toIndex);
}
@end
