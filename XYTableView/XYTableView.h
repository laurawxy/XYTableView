//
//  XYTableView.h
//  DuiDeRen
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TableViewVoidBlock)(void);

@interface XYTableView : UITableView

@property (nonatomic) BOOL showNoInternetButton;
@property (nonatomic) TableViewVoidBlock noInternetBlock;

@property (nonatomic) BOOL noInternet;
@property (nonatomic) BOOL showEmptyDataStatus;
@property (nonatomic) BOOL endRefresh;
@property (nonatomic) BOOL needRefresh;

@property (nonatomic) NSString *emptyString;
@property (nonatomic) UIImage *emptyImage;
@property (nonatomic) UIFont *emptyStringFont;
@property (nonatomic) UIColor *emptyStringColor;
@property (nonatomic) NSString *noInternetButtonString;

@property (nonatomic) NSString *typeCode;
@property (nonatomic) NSString *flag;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSMutableArray *dataArray;

- (void)setRefreshHeaderWithRefreshingBlock:(TableViewVoidBlock)refreshBlock;
- (void)setRefreshFooterWithRefreshingBlock:(TableViewVoidBlock)refreshBlock;

- (void)refreshHeaderBeginRefreshing;
- (void)refreshFooterBeginRefreshing;
- (void)refreshHeaderFooterEndRefreshing;

- (void)refreshFooterHidden;
- (void)refreshFooterShow;

//- (void)setHeaderWhiteTintColor;

@end
