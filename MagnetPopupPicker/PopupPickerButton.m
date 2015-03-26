//
//  PopupPickerButton.m
//  Whizz3.0
//
//  Created by ufuk on 4/21/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "PopupPickerButton.h"
#import "PickerViewController.h"
#import "PopoverView.h"

@interface PopupPickerButton()

@property NSArray *options;
@property PopoverView *popover;
@property NSString *placeholder;

@end


@implementation PopupPickerButton


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initButton];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)coder {
    if(self = [super initWithCoder:coder])
    {
        [self initButton];
    }
    return self;
}

-(void)initButton {
    [self setDefaults];
    [self loadController];
    [self addTarget:self action:@selector(openPopover:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDefaults {
    self.pickerSize = CGSizeMake(300, 200);
}

- (void)loadController {
    self.pickerController = [[PickerViewController alloc] initWithNibName:nil bundle:nil];
    self.pickerController.delegate = self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    if(!self.placeholder)
        self.placeholder = title;
    [super setTitle:title forState:state];
}

- (void)setOptions:(NSArray *)list keyNames:(KeyValuePair *)names {
    self.selectedPair = nil;
    [self.pickerController setOptionList:list keyNames:names];
    [self setTitle:self.placeholder forState:UIControlStateNormal];
}

- (void)setSelectedValue:(NSString *)value {
    NSArray *filtered = [self.pickerController.optionList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self.%@ = %@", self.pickerController.keyNames.key, value]];
    if(filtered.count > 0)
    {
        self.selectedPair = [[KeyValuePair alloc] initWithKeyValue:[[filtered objectAtIndex:0] valueForKey:self.pickerController.keyNames.key] value:[[filtered objectAtIndex:0] valueForKey:self.pickerController.keyNames.value]];
        [self setTitle:self.selectedPair.value forState:UIControlStateNormal];
    }
}

- (void)clearValue {
    self.selectedPair = nil;
    [self.pickerController clearValue];
    [self setTitle:self.placeholder forState:UIControlStateNormal];
}

- (void)pickerViewController:(id)sender submitClicked:(KeyValuePair *)selected {
    self.selectedPair = selected;
    [self.pickerController resetSearch];
    [self setTitle:self.selectedPair.value forState:UIControlStateNormal];
    [self.stateDelegate popupPickerButtonValueChanged:self];
    [self.popover dismissPopover];
}

- (void)pickerViewControllerCancelClicked:(id)sender {
    [self clearValue];
    [self.stateDelegate popupPickerButtonValueChanged:self];
    [self.popover dismissPopover];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
}

- (NSObject *)fieldText {
    return self.selectedPair.value;
}

- (NSObject *)fieldValue {
    return self.selectedPair.key;
}

- (void)openPopover:(UIButton *)button {
    if([self.popover isVisible]) {
        [self.popover dismissPopover];
        return;
    }
    self.pickerController.view.frame = CGRectMake(0, 0, self.pickerSize.width, self.pickerSize.height);
    self.popover = [[PopoverView alloc] initWithContentView:self.pickerController.view];
    [self.pickerController selectFirstElement];
    self.popover.backgroundColor = [UIColor lightGrayColor];
    [self.popover showPopover:self.frame];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
