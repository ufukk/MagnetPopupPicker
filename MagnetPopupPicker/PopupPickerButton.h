//
//  PopupPickerButton.h
//  Whizz3.0
//
//  Created by ufuk on 4/21/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@protocol PopupPickerButtonStateDelegate

-(void)popupPickerButtonValueChanged:(id)sender;

@end


@interface PopupPickerButton : UIButton<UIPopoverControllerDelegate, PickerViewControllerDelegate>

@property CGSize pickerSize;

@property PickerViewController *pickerController;

@property KeyValuePair *selectedPair;

@property (nonatomic,weak) id<PopupPickerButtonStateDelegate> stateDelegate;

-(void)setOptions:(NSArray *)list keyNames:(KeyValuePair *)names;

-(void)setSelectedValue:(NSString *)value;

-(void)clearValue;

-(NSObject *)fieldValue;

-(NSObject *)fieldText;

@end
