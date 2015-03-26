//
//  PickerViewController.h
//  Whizz3.0
//
//  Created by ufuk on 4/16/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "MagnetKeyValuePair.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MagnetPickerViewControllerDelegate <NSObject>

-(void)pickerViewController:(id)sender submitClicked:(MagnetKeyValuePair *)selected;

-(void)pickerViewControllerCancelClicked:(id)sender;

@end


@interface MagnetPickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (readonly) MagnetKeyValuePair *keyNames;

@property NSArray *optionList;

@property NSArray *filteredOptions;

@property (nonatomic, weak) id<MagnetPickerViewControllerDelegate> delegate;

-(void)selectFirstElement;

-(void)setOptionList:(NSArray *)list keyNames:(MagnetKeyValuePair *)names;

-(void)clearValue;

-(void)resetSearch;

@end
