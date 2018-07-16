//
//  XYTableFootView.m
//  DuiDeRen
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTableFootView.h"

@interface XYTableFootView()
/**
 标题
 */
@property(nonatomic,strong)UILabel *noDataLabel;
@property(nonatomic,strong)UILabel *leftLineLabel;
@property(nonatomic,strong)UILabel *rightLineLabel;
@end
@implementation XYTableFootView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self layout];
    }
    return self;
}

//布局
-(void)layout{
    self.backgroundColor = [UIColor clearColor];
    
    //中间的
    _noDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-40, 0, 80, 50)];
    _noDataLabel.text = @"无更多数据";
    _noDataLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _noDataLabel.textAlignment = NSTextAlignmentCenter;
    _noDataLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [_noDataLabel sizeThatFits:CGSizeMake(999, 50)];
    _noDataLabel.frame = CGRectMake(self.frame.size.width/2-size.width/2, 0, size.width, 50);
    [self addSubview:_noDataLabel];
    
    //左边的
    _leftLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_noDataLabel.frame)-56, 24.5, 40, 1)];
    _leftLineLabel.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];;
    [self addSubview:_leftLineLabel];
    
    //右边的
    _rightLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_noDataLabel.frame)+16, 24.5, 40, 1)];
    _rightLineLabel.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self addSubview:_rightLineLabel];
    
}

-(void)setTitle:(NSString *)title{
    _noDataLabel.text = title;
    CGSize size = [_noDataLabel sizeThatFits:CGSizeMake(999, 50)];
    _noDataLabel.frame = CGRectMake(self.frame.size.width/2-size.width/2, 0, size.width, 50);
    _leftLineLabel.frame = CGRectMake(CGRectGetMinX(_noDataLabel.frame)-56, 24.5, 40, 1);
    _rightLineLabel.frame = CGRectMake(CGRectGetMaxX(_noDataLabel.frame)+16, 24.5, 40, 1);
    
}










@end
