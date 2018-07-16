//
//  XYRefreshNormalHeader.m
//  DuiDeRen
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYRefreshNormalHeader.h"

@interface XYRefreshNormalHeader ()
@property (nonatomic, strong) UIImageView *circleView;
@property (nonatomic, strong) UIImageView *logoView;
@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@end

#pragma mark - Const
CGRect kZZZLogoViewBounds = {0,0,24,24};

@implementation XYRefreshNormalHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    self.mj_h = 78;//MJRefresh默认高度54

    [self addSubview:self.circleView];
    [self addSubview:self.logoView];
    
    self.shapeLayer = ({
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.bounds = kZZZLogoViewBounds;
        shapeLayer.position = CGPointMake(kZZZLogoViewBounds.size.width/2, kZZZLogoViewBounds.size.height/2);
        shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor colorWithRed:46/255.0f green:137/255.0f blue:248/255.0f alpha:1].CGColor;
        shapeLayer.lineWidth = 2.f;
        
        //二次贝塞尔曲线
        UIBezierPath *facePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(shapeLayer.frame.size.width/2, shapeLayer.frame.size.height/2) radius:shapeLayer.frame.size.height/2 startAngle:M_PI endAngle:3*M_PI clockwise:YES];
        shapeLayer.path = facePath.CGPath;
        shapeLayer;
    });
    
    [self.circleView.layer addSublayer:self.shapeLayer];
}

#pragma mark 在这里设置子控件的位置和尺寸

- (void)placeSubviews
{
    [super placeSubviews];
    self.circleView.center = CGPointMake(self.mj_w/2.0, 20.0+kZZZLogoViewBounds.size.height/2);
    self.circleView.bounds = kZZZLogoViewBounds;
    
    CGRect frame = self.logoView.frame;
    frame.origin = CGPointMake(self.frame.size.width/2-self.logoView.frame.size.width/2, CGRectGetMaxY(self.circleView.frame)+10);
    self.logoView.frame = frame;
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            break;
        case MJRefreshStatePulling:{
            //松开就可以刷新的状态 震动
            if (@available(iOS 10.0, *)) {
                UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];
                [generator prepare];
                [generator impactOccurred];
            } else {
                // Fallback on earlier versions
            }
            
        }
            break;
        case MJRefreshStateRefreshing:
            break;
        default:
            break;
    }
}
- (void)beginRefreshing{
    [self addTransformAnimation];
    [super beginRefreshing];
}
- (void)endRefreshing{
    [self.shapeLayer removeAllAnimations];
    [super endRefreshing];
}

#pragma mark - setter & getter

- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] init];
        _logoView.image = [UIImage new];
        [_logoView sizeToFit];
    }
    return _logoView;
}

- (UIImageView *)circleView{
    if (!_circleView) {
        _circleView = [[UIImageView alloc] init];
//        _circleView.image = [XYThemeImage icon_we_headPlaceHolder];
    }
    return _circleView;
}

-(void)addTransformAnimation{
    
    //绘制动画
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    lineWidthAnimation.fromValue = @2;
    lineWidthAnimation.toValue = @0;
    lineWidthAnimation.duration = 0.5f;
    lineWidthAnimation.repeatCount = CGFLOAT_MAX;
    lineWidthAnimation.autoreverses = YES;
    lineWidthAnimation.fillMode = kCAFillModeForwards;
    lineWidthAnimation.removedOnCompletion = NO;
    lineWidthAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];

    [self.shapeLayer addAnimation:lineWidthAnimation forKey:nil];
}

@end
