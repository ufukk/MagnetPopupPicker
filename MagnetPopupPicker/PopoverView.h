//
//  PopoverView.h
//  MagnetPopupPicker
//
//  Created by ufuk on 14/03/15.
//
//

#import <UIKit/UIKit.h>

@interface PopoverView : UIView

@property CGFloat horizontalPadding;

@property CGFloat verticalPadding;

@property (nonatomic, readonly) UIView *contentView;

- (instancetype)initWithContentView:(UIView *)contentView;

- (void)showPopover:(UIView *)targetView;

- (void)dismissPopover;

- (BOOL)isVisible;

@end
