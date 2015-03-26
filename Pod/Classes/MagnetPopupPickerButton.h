//
//  PopupPickerButton.h
//  Whizz3.0
//
//  Created by ufuk on 4/21/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagnetPickerViewController.h"

@protocol PopupPickerButtonStateDelegate

-(void)popupPickerButtonValueChanged:(id)sender;

@end


@interface MagnetPopupPickerButton : UIButton<UIPopoverControllerDelegate, MagnetPickerViewControllerDelegate>

@property CGSize pickerSize;

@property UIColor *popoverColor;

@property MagnetPickerViewController *pickerController;

@property MagnetKeyValuePair *selectedPair;

@property (nonatomic,weak) id<PopupPickerButtonStateDelegate> stateDelegate;

-(void)setOptions:(NSArray *)list keyNames:(MagnetKeyValuePair *)names;

-(void)setSelectedValue:(NSString *)value;

-(void)clearValue;

-(NSObject *)fieldValue;

-(NSObject *)fieldText;

@end
