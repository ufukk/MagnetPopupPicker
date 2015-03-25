//
//  PopoverView.m
//  MagnetPopupPicker
//
//  Created by ufuk on 14/03/15.
//
//

#import "PopoverView.h"

@interface PopoverView()

@property UIGestureRecognizer *tapRecognizer;

@end

@implementation PopoverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithContentView:(UIView *)contentView {
    if(self = [super initWithFrame:CGRectNull]) {
        self->_contentView = contentView;
        self.verticalPadding = 5.0;
        self.horizontalPadding = 5.0;
        [self resetSize];
    }
    return self;
}

- (void)resetSize {
    self.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (CGSize)windowSize {
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    CGRect convertedRect = [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:windowRect fromView:nil];
    return convertedRect.size;
}


- (CGPoint)findPositionWithTarget:(UIView *)targetView {
    CGSize windowSize = [self windowSize];
    CGPoint point = CGPointMake(targetView.frame.origin.x, targetView.frame.origin.y + targetView.frame.size.height + self.verticalPadding);
    if(point.x + self.frame.size.width > windowSize.width) {
        point.x -= (point.x + self.frame.size.width) - windowSize.width + self.horizontalPadding;
    }
    
    if(point.y + self.frame.size.height > windowSize.height) {
        point.y = targetView.frame.origin.y - self.frame.size.height - self.verticalPadding;
    }
    
    return point;
}

- (void)layoutSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
}

- (UIView *)rootView {
    return [[[UIApplication sharedApplication] keyWindow] rootViewController].view;
}

- (void)setEvents {
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(dismissPopover)];
    [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:self.tapRecognizer];
}

- (void)dismissPopover {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [[[[UIApplication sharedApplication] delegate] window] removeGestureRecognizer:self.tapRecognizer];
        self.alpha = 1;
    }];
}

- (BOOL)isVisible {
    return self.superview != nil;
}

- (void)showPopover:(UIView *)targetView {
    [self resetSize];
    CGPoint position = [self findPositionWithTarget:targetView];
    CGRect frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
    self.frame = frame;
    self.alpha = 0;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self setEvents];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0.0];
    self.alpha = 1;
    [UIView commitAnimations];
}

@end
