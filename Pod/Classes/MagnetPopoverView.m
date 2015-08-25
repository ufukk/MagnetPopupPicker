//
//  PopoverView.m
//  MagnetPopupPicker
//
//  Created by ufuk on 14/03/15.
//
//

#import "MagnetPopoverView.h"
#import <QuartzCore/QuartzCore.h>

@interface MagnetPopoverView()

@property UIGestureRecognizer *tapRecognizer;
@property UIView *containerView;
@property CGRect targetRect;

@end

@implementation MagnetPopoverView

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super initWithFrame:CGRectNull])
    {
        self->_contentView = contentView;
        self.verticalPadding = 5.0;
        self.horizontalPadding = 5.0;
        self.arrowWidth = 20;
        self.arrowHeight = 15;
    }
    return self;
}

- (void)resetSize {
    self.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height + self.arrowHeight);
}

- (CGSize)windowSize {
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    CGRect convertedRect = [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:windowRect fromView:nil];
    return convertedRect.size;
}


- (CGPoint)findPositionWithTarget {
    CGSize windowSize = [self windowSize];
    CGPoint point = CGPointMake(self.targetRect.origin.x, self.targetRect.origin.y - self.frame.size.height - self.verticalPadding);
    if(point.x + self.frame.size.width > windowSize.width) {
        point.x -= (point.x + self.frame.size.width) - windowSize.width + self.horizontalPadding;
    }
    
    if(point.y < 0) {
        point.y = self.targetRect.origin.y + self.targetRect.size.height + self.verticalPadding;
    }
    
    return point;
}

- (void)layoutSubviews {
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.origin.y > self.targetRect.origin.y ? self.arrowHeight : 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    self.containerView.backgroundColor = self.backgroundColor;
    [self.containerView addSubview:self.contentView];
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    self.containerView.layer.cornerRadius = 15.0;
    self.containerView.layer.masksToBounds = YES;
    [self addSubview:self.containerView];
}

- (void)drawArrow {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGFloat x = self.frame.origin.x > self.targetRect.size.width + self.targetRect.origin.x ? 0 : self.frame.origin.x + self.frame.size.width < self.targetRect.origin.x ? self.frame.size.width - self.arrowWidth : (self.targetRect.origin.x - self.frame.origin.x);
    x = x < self.containerView.layer.cornerRadius ? self.containerView.layer.cornerRadius : x > self.frame.size.width - self.arrowWidth - self.containerView.layer.cornerRadius ? self.frame.size.width - self.arrowWidth - self.containerView.layer.cornerRadius : x;
    CGFloat y = self.frame.origin.y > self.targetRect.origin.y ? CGRectGetMinY(rect) : CGRectGetMaxY(rect);
    CGFloat yEdge = self.frame.origin.y > self.targetRect.origin.y ? CGRectGetMinY(rect) + self.arrowHeight : CGRectGetMaxY(rect) - self.arrowHeight;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, x, yEdge);
    CGContextAddLineToPoint(ctx, x + self.arrowWidth * 2, yEdge);
    CGContextAddLineToPoint(ctx, x + self.arrowWidth, y);
    CGContextClosePath(ctx);
    
    CGContextSetFillColorWithColor(ctx, self.containerView.backgroundColor.CGColor);
    CGContextFillPath(ctx);
}

- (void)drawRect:(CGRect)rect {
    [self drawArrow];
}

- (UIView *)rootView {
    return [[[UIApplication sharedApplication] keyWindow] rootViewController].view;
}

- (void)setEvents {
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(dismissPopover)];
    [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:self.tapRecognizer];
}

- (void)dismissPopover {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [[[[UIApplication sharedApplication] delegate] window] removeGestureRecognizer:self.tapRecognizer];
        self.alpha = 1;
    }];
}

- (BOOL)isVisible
{
    return self.superview != nil;
}

- (void)showPopoverFromButton:(UIButton *)button
{
    [self resetSize];
    self.targetRect = button.frame;
    CGPoint position = [self findPositionWithTarget];
    CGRect frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
    self.frame = frame;
    self.alpha = 0;
    [button.superview addSubview:self];
    [self setEvents];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelay:0.0];
    self.alpha = 1;
    [UIView commitAnimations];
}

@end
