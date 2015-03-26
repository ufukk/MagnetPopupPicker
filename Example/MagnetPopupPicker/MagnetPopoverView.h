//
//  PopoverView.h
//  MagnetPopupPicker
//
//  Created by ufuk on 14/03/15.
//
//

#import <UIKit/UIKit.h>

@interface MagnetPopoverView : UIView

@property CGFloat horizontalPadding;

@property CGFloat verticalPadding;

@property CGFloat arrowHeight;

@property CGFloat arrowWidth;

@property (nonatomic, readonly) UIView *contentView;

- (instancetype)initWithContentView:(UIView *)contentView;

- (void)showPopover:(CGRect)targetRect;

- (void)dismissPopover;

- (BOOL)isVisible;

@end
