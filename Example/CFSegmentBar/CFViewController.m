//
//  CFViewController.m
//  CFSegmentBar
//
//  Created by chriscaixx@gmail.com on 05/06/2017.
//  Copyright (c) 2017 chriscaixx@gmail.com. All rights reserved.
//

#import "CFViewController.h"
#import "UIView+CFSegmentBar.h"
#import "CFSegmentBar.h"
@interface CFViewController ()<CFSegmentBarDelegate>

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
    
    bar.items = @[@"推荐",@"精品",@"最新",@"推荐",@"精品",@"最新",@"推荐",@"精品",@"最新"];
    
    bar.selectedIndex = 0;
}

- (void)segmentBar:(CFSegmentBar *)bar didSelectedItemsToIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%zd ---> %zd",fromIndex, toIndex);
}
@end
