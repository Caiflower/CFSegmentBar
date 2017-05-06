//
//  CFSegmentBar.m
//  CFSegmentBar
//
//  Created by mac on 2017/5/6.
//  Copyright © 2017年 chriscaixx@gmail.com. All rights reserved.
//

#import "CFSegmentBar.h"
#import "UIView+CFSegmentBar.h"
@interface CFSegmentBar ()
{
    /** 按钮总款 */
    CGFloat _totalWidth;
    /** 记录选中的按钮 */
    UIButton * _selectedButton;
}
/** 内容视图 */
@property(nonatomic, weak)  UIScrollView *containerView;
/** 按钮数组 */
@property(nonatomic, strong)  NSMutableArray<UIButton *> *titleButtons;
/** 指示器 */
@property(nonatomic, weak)  UIView *indicatorView;
@end


static CGFloat const defaultMinMargin = 30;
@implementation CFSegmentBar

+ (instancetype)segmentBarWithFrame:(CGRect)frame
{
    CFSegmentBar * bar = [[CFSegmentBar alloc] initWithFrame:frame];
    return bar;
}
#pragma mark -
#pragma mark - =============== setter ===============
- (void)setItems:(NSArray<NSString *> *)items
{
    _items = items;
    // 解决重复赋值问题
    [self.titleButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.titleButtons = nil;
    // 重置总宽
    _totalWidth = 0;
    for (NSString * title in items) {
        UIButton * btn = [[UIButton alloc] init];
        btn.tag = self.titleButtons.count;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn sizeToFit];
        _totalWidth += btn.cf_width;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:btn];
        [self.titleButtons addObject:btn];
    }
    // 添加需要重新布局标记
    [self setNeedsLayout];
    // 重新布局
    [self layoutIfNeeded];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (self.titleButtons.count == 0 || selectedIndex < 0 || selectedIndex > self.titleButtons.count - 1)
    {
        if (self.titleButtons.count == 0)
        {
            NSAssert(self.titleButtons.count != 0, @"请先设置 items 标题数组");
        }
        else
        {
            NSString * tip = [NSString stringWithFormat:@"selectedIndex = %zd设置不合法",selectedIndex];
            BOOL flag = selectedIndex > 0 && self.titleButtons.count - 1 >= selectedIndex;
            NSAssert(flag, tip);
        }
        return;
    }
    _selectedIndex = selectedIndex;
    
    UIButton * btn = self.titleButtons[selectedIndex];
    [self btnClick:btn];
}


#pragma mark -
#pragma mark - =============== 私有方法 ===============
- (void)btnClick:(UIButton *)btn
{
    // 调用代理方法
    if (_delegate && [_delegate respondsToSelector:@selector(segmentBar:didSelectedItemsToIndex:fromIndex:)]) {
        [_delegate segmentBar:self didSelectedItemsToIndex:btn.tag fromIndex:_selectedButton.tag];
    }
    // 切换状态
    _selectedButton.selected = NO;
    btn.selected = YES;
    _selectedButton = btn;
    // 使对应的按钮居中
    CGFloat offsetX = btn.cf_x - self.containerView.cf_width * 0.5;
    // 边界处理
    if (offsetX < 0 )
    {
        offsetX = 0;
    }
    else if (offsetX > self.containerView.contentSize.width - self.containerView.cf_width)
    {
        offsetX = self.containerView.contentSize.width - self.containerView.cf_width;
    }
    
    [self.containerView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
#pragma mark -
#pragma mark - =============== 布局子控件 ===============
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.containerView.frame = self.bounds;
    // 计算间距
    CGFloat margin = (self.cf_width - _totalWidth) / (self.items.count + 1);
    if (margin < defaultMinMargin)
    {
        margin = defaultMinMargin;
    }
    CGFloat lastBtnX = margin;
    UIButton * lastButton;
    for (UIButton * btn in self.titleButtons) {
        // w h
        [btn sizeToFit];
        // x y
        btn.cf_centerY = self.containerView.cf_centerY;
        btn.cf_x = lastBtnX;
        lastBtnX += btn.cf_width + margin;
        if (btn == self.titleButtons.lastObject) {
            lastButton = btn;
        }
    }
    // 计算 containerView contentSize
    self.containerView.contentSize = CGSizeMake(CGRectGetMaxX(lastButton.frame) + margin, 0);
}

#pragma mark -
#pragma mark - =============== 懒加载 ===============
- (NSMutableArray *)titleButtons
{
    if (!_titleButtons)
    {
        _titleButtons =  [[NSMutableArray alloc] init];
    }
    return _titleButtons;
}
- (UIScrollView *)containerView
{
    if (!_containerView)
    {
        UIScrollView * containerView =  [[UIScrollView alloc] init];
        containerView.showsVerticalScrollIndicator = NO;
        containerView.showsHorizontalScrollIndicator = NO;
        [self addSubview:containerView];
        _containerView = containerView;
    }
    return _containerView;
}
- (UIView *)indicatorView
{
    if (!_indicatorView)
    {
        UIView * indicatorView =  [[UIView alloc] init];
        [self addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

@end
