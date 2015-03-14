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
    CGPoint point = CGPointMake(targetView.frame.origin.x, targetView.frame.origin.y);
    if(point.x + self.frame.size.width > windowSize.width) {
        point.x -= (point.x + self.frame.size.width) - windowSize.width;
    }
    
    if(point.y + self.frame.size.height > windowSize.height) {
        point.y -= (point.y + self.frame.size.height) - windowSize.height;
    }
    
    return point;
}

- (void)layoutSubviews {
    self.backgroundColor = [UIColor lightGrayColor];
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
    [self removeFromSuperview];
    [[[[UIApplication sharedApplication] delegate] window] removeGestureRecognizer:self.tapRecognizer];
}

- (void)showPopover:(UIView *)targetView {
    CGPoint position = [self findPositionWithTarget:targetView];
    CGRect frame = CGRectMake(position.x, position.y, self.frame.size.width, self.frame.size.height);
    self.frame = frame;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [self setEvents];
}

@end
