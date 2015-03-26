//
//  DemoViewController.m
//  MagnetPopupPicker
//
//  Created by ufuk on 08/10/14.
//
//

#import "DemoViewController.h"
#import <MagnetPopupPicker/MagnetPopupPickerButton.h>

@interface DemoViewController ()

@property MagnetPopupPickerButton *button;

@property UIButton *button1;

@property UIButton *button2;

@property MagnetPopupPickerButton *button3;

@property MagnetPopupPickerButton *button4;

@property MagnetPopupPickerButton *button5;


@end

@implementation DemoViewController

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
    
    self.button = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(170, 50, 150, 30)];
    self.button.backgroundColor = [UIColor darkGrayColor];
    self.button.popoverColor = [UIColor darkGrayColor];
    [self.button setTitle:@"Select" forState:UIControlStateNormal];
    
    NSArray *list = [NSArray arrayWithObjects:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"Q test"],
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"W test"],
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"E Test"],
                     nil];
    
    [self.button setOptions:list keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button];
    
    self.button4 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 170, 50, 150, 30)];
    self.button4.backgroundColor = [UIColor darkGrayColor];
    [self.button4 setTitle:@"Select" forState:UIControlStateNormal];
    [self.button4 setOptions:list keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button4];
    
    
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button1.frame = CGRectMake(20, 90, 100, 30);
    [self.button1 setTitle:@"BUTTON 1" forState:UIControlStateNormal];
    [self.button1 addTarget:nil action:@selector(button1Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button2.frame = CGRectMake(20, 250, 100, 30);
    [self.button2 setTitle:@"BUTTON 2" forState:UIControlStateNormal];
    [self.button2 addTarget:nil action:@selector(button2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    
    self.button3 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(170, self.view.bounds.size.height - 50, 150, 30)];
    self.button3.backgroundColor = [UIColor darkGrayColor];
    [self.button3 setTitle:@"Select" forState:UIControlStateNormal];
    [self.button3 setOptions:list keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button3];
    
    self.button5 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 170, self.view.bounds.size.height - 50, 150, 30)];
    self.button5.backgroundColor = [UIColor darkGrayColor];
    self.button5.popoverColor = [UIColor lightGrayColor];
    [self.button5 setTitle:@"Select" forState:UIControlStateNormal];
    [self.button5 setOptions:list keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button5];

    
}

- (void)button1Clicked {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event" message:@"Button1 clicked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)button2Clicked {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event" message:@"Button2 clicked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
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
