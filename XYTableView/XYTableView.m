//
//  XYTableView.m
//  DuiDeRen
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTableView.h"
#import "XYRefreshNormalHeader.h"
#import "XYRefreshNormalFooter.h"
#import "XYTableFootView.h"

@interface XYTableView()

//MJRefreshGifHeader
@property (nonatomic, strong) XYRefreshNormalHeader *header;

@property(nonatomic,strong)XYTableFootView *noDataFootView;

@end

@implementation XYTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)setRefreshHeaderWithRefreshingBlock:(TableViewVoidBlock)refreshBlock{
    __weak typeof(self) weakSelf = self;
    _header = [XYRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.endRefresh = NO;
        if (refreshBlock) {
            refreshBlock();
        }
    }];
    self.mj_header = _header;
}


- (void)setRefreshFooterWithRefreshingBlock:(TableViewVoidBlock)refreshBlock{
    __weak typeof(self) weakSelf = self;
    self.mj_footer = [XYRefreshNormalFooter footerWithRefreshingBlock:^{
        weakSelf.endRefresh = NO;
        if (refreshBlock) {
            refreshBlock();
        }
    }];
}

- (void)refreshHeaderBeginRefreshing{
    _currentPage=1;
    self.endRefresh = NO;
    [self.mj_header beginRefreshing];
}
- (void)refreshFooterBeginRefreshing{
    self.endRefresh = NO;
    [self.mj_header beginRefreshing];
}

- (void)refreshHeaderFooterEndRefreshing{
    if (self.mj_header && self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer && self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
    self.endRefresh = YES;
}

- (void)refreshFooterHidden{
    [self.mj_footer setHidden:YES];
    if (!self.tableFooterView && self.dataArray.count>0) {
        self.tableFooterView = self.noDataFootView;
    }else if(self.tableFooterView && self.tableFooterView == self.noDataFootView && self.dataArray.count == 0){
        self.tableFooterView = nil;
    }
}

- (void)refreshFooterShow{
    [self.mj_footer setHidden:NO];
    if (self.tableFooterView && self.tableFooterView == self.noDataFootView) {
        self.tableFooterView = nil;
    }
}

- (XYTableFootView *)noDataFootView{
    if (!_noDataFootView) {
        _noDataFootView = [[XYTableFootView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    }
    return _noDataFootView;
}

- (void)setNoInternet:(BOOL)noInternet{
    _noInternet = noInternet;
    _showNoInternetButton = _noInternet;
    if (_noInternet) {
        [self refreshHeaderFooterEndRefreshing];
    }
    [self reloadData];
}

-(BOOL)needRefresh{
    if (self.dataArray.count == 0 && !self.mj_header.isRefreshing) {
        return YES;
    }
    return NO;
}

//- (void)setHeaderWhiteTintColor{
////    _header.arrowView.image = [[UIImage imageNamed:@"dropdown_xxxx_001"] setImageWithTintColor:[UIColor whiteColor]];
//    _header.stateLabel.textColor = [UIColor whiteColor];
//    _header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
//    self.mj_header = _header;
//}

@end
