//
//  YRDrawView.m
//  draw
//
//  Created by yangrui on 2018/6/28.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRDrawView.h"

@interface YRDrawView ()

@property (assign, nonatomic)CGPoint point ;
@end


@implementation YRDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   CGPoint point = [[touches anyObject] locationInView:self];
    self.point = point;
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    self.point = point;
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    self.point = point;
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect{
    
/**绘制线条*/
//    [self drawLine];
/**绘制圆角矩形*/
//    [self drawRoundRectCornerRadius:0];
    
/**绘制指定方位的圆角矩形*/
//    [self drawRoundRectCornerAtPosition:UIRectCornerTopLeft   ];
    
/**绘制椭圆*/
//    [self drawOval];
    
/**绘制圆弧*/
//    [self drawArc];
    
/** 绘制贝塞尔曲线 */
//    [self drawBezierCurveControlPoint:self.point];
  
    
/**绘制2个控制点的贝塞尔曲线*/
    CGPoint p1 = CGPointMake(self.point.x
                             , self.frame.size.height * 0.5 -100);
    CGPoint p2 = CGPointMake(self.point.x
                             , self.frame.size.height * 0.5 +100);
    [self drawBezierCurve2CtrPoint1:p1 ctrPoint2:p2];

}

/**绘制2个控制点的贝塞尔曲线*/
-(void)drawBezierCurve2CtrPoint1:(CGPoint)ctrPoint1 ctrPoint2:(CGPoint)ctrPoint2{
    
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    CGPoint leftBottomPoint = CGPointMake(50, self.frame.size.height * 0.5 + 50);
    CGPoint rightTopPoint = CGPointMake(self.frame.size.width - 50, self.frame.size.height * 0.5 - 50);
    [path moveToPoint:leftBottomPoint];
    // 给定终点和两个控制点绘制贝塞尔曲线
    [path addCurveToPoint:rightTopPoint controlPoint1:ctrPoint1 controlPoint2:ctrPoint2];
    
    [path stroke];
 
    
}



/** 绘制贝塞尔曲线 */
- (void)drawBezierCurveControlPoint:(CGPoint)ctrPoint{
    
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(0 , 0)];
    
    // 给定终点和控制点绘制贝塞尔曲线
    [path addQuadCurveToPoint:CGPointMake(0 , self.frame.size.height ) controlPoint:ctrPoint];
    
    [path stroke];
}

/**绘制圆弧*/
- (void)drawArc{
    
    [[UIColor redColor] set];
    // 创建弧线路径对象
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                        radius:70
                                                    startAngle:3.1415926
                                                      endAngle:3.1415926 *3/2
                                                     clockwise:YES];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
}


/**绘制椭圆*/
- (void)drawOval{
    
    [[UIColor redColor] set];
    // 创建圆形路径对象
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 80, 100)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
}




/**绘制指定方位的圆角矩形*/
- (void)drawRoundRectCornerAtPosition:(UIRectCorner )position{
    
    [[UIColor redColor] set];
    
    // 注意: cornerRadii 这个参数取最大值得,得到的矩形
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 150) byRoundingCorners:position cornerRadii:CGSizeMake(60, 10)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
}



/**绘制圆角矩形*/
-(void)drawRoundRectCornerRadius:(CGFloat)cornerRadius {
        
    [[UIColor redColor] set];
    // 创建圆角矩形路径对象
//    [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 150, 100)] // 仅仅是直角矩形
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 100) cornerRadius:cornerRadius]; // 圆角半径为30
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
}



/**绘制线条*/
-(void)drawLine{
    
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    // 起点
    [path moveToPoint:CGPointMake(20, 100)];
    
    // 绘制线条
    [path addLineToPoint:CGPointMake(200, 20)];
    
    [path stroke];
}


@end
