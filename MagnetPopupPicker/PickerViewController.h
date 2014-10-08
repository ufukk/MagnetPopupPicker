//
//  PickerViewController.h
//  Whizz3.0
//
//  Created by ufuk on 4/16/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "KeyValuePair.h"

@protocol PickerViewControllerDelegate <NSObject>

-(void)pickerViewController:(id)sender submitClicked:(KeyValuePair *)selected;

-(void)pickerViewControllerCancelClicked:(id)sender;

@end


@interface PickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (readonly) KeyValuePair *keyNames;

@property NSArray *optionList;

@property NSArray *filteredOptions;

@property (nonatomic, weak) id<PickerViewControllerDelegate> delegate;

-(void)selectFirstElement;

-(void)setOptionList:(NSArray *)list keyNames:(KeyValuePair *)names;

-(void)clearValue;

-(void)resetSearch;

@end
