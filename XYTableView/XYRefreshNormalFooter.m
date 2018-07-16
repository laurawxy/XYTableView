//
//  XYRefreshNormalFooter.m
//  DuiDeRen
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYRefreshNormalFooter.h"

@implementation XYRefreshNormalFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)prepare
{
    [super prepare];
    
    [self setTitle:@"数据加载中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    
    
    self.stateLabel.font = [UIFont systemFontOfSize:12];
}


@end
