//
//  PickerViewController.m
//  Whizz3.0
//
//  Created by ufuk on 4/16/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "MagnetPickerViewController.h"
#import "MagnetKeyValuePair.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagnetPickerViewController ()


@property UIPickerView *pickerView;
@property MagnetKeyValuePair *selectedPair;
@property UITextField *searchField;

@end

@implementation MagnetPickerViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"X"]];
    cancelButton.frame = CGRectMake(10, 10, 30, 30);
    cancelButton.momentary = YES;
    [cancelButton addTarget:self action:@selector(cancelClicked) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:cancelButton];
    
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(48, 10, 175, 30)];
    self.searchField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.searchField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchField.placeholder = @"Search";
    self.searchField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.searchField addTarget:self action:@selector(searchValueChanged) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.searchField];
    [self.searchField reloadInputViews];
    
    UISegmentedControl *submitButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"OK"]];
    submitButton.momentary = YES;
    [submitButton addTarget:self action:@selector(submitClicked) forControlEvents:UIControlEventValueChanged];
    submitButton.frame = CGRectMake(230,  10, 60, 30);
    [self.view addSubview:submitButton];
    
    [self selectFirstElement];
    [self loadPicker];
}

-(void)selectFirstElement
{
    if(self.filteredOptions.count > 0)
        self.selectedPair = [[MagnetKeyValuePair alloc] initWithKeyValue:[[self.filteredOptions objectAtIndex:0] valueForKey:self.keyNames.key] value:[[self.filteredOptions objectAtIndex:0] valueForKey:self.keyNames.value]];
}

-(void)loadPicker
{
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 35, 300, 200)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
}


-(void)setOptionList:(NSArray *)list keyNames:(MagnetKeyValuePair *)names
{
    self.optionList = list;
    self.filteredOptions = [self.optionList copy];
    self->_keyNames = names;
    [self.pickerView reloadAllComponents];
}

-(void)resetSearch
{
    self.searchField.text = @"";
    if(self.keyNames && self.searchField)
        [self searchValueChanged];
}

-(void)clearValue
{
    self.selectedPair = nil;
    self.searchField.text = @"";
    [self resetSearch];
    [self.pickerView selectRow:0 inComponent:0 animated:NO];
}

-(void)submitClicked
{
    if(!self.selectedPair)
        [self selectFirstElement];
    [self.delegate pickerViewController:self submitClicked:self.selectedPair];
}

-(void)cancelClicked
{
    self.selectedPair = nil;
    [self.delegate pickerViewControllerCancelClicked:self];
}

-(void)searchValueChanged
{
    self.filteredOptions = [self.optionList filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(MagnetKeyValuePair *evaluatedObject, NSDictionary *bindings) {
        NSRange range = [[evaluatedObject valueForKey:self.keyNames.value] rangeOfString:self.searchField.text options:NSCaseInsensitiveSearch];
        return range.location == 0 || self.searchField.text.length < 1;
    }]];
    [self selectFirstElement];
    [self.pickerView reloadAllComponents];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.filteredOptions count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%@", [[self.filteredOptions objectAtIndex:row] valueForKey:self.keyNames.value]];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(row < self.filteredOptions.count)
        self.selectedPair = [[MagnetKeyValuePair alloc] initWithKeyValue:[[self.filteredOptions objectAtIndex:row] valueForKey:self.keyNames.key] value:[[self.filteredOptions objectAtIndex:row] valueForKey:self.keyNames.value]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
