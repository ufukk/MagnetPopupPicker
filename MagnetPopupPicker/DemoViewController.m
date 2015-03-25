//
//  DemoViewController.m
//  MagnetPopupPicker
//
//  Created by ufuk on 08/10/14.
//
//

#import "DemoViewController.h"
#import "PopupPickerButton.h"
#import "KeyValuePair.h"

@interface DemoViewController ()

@property PopupPickerButton *button;

@property UIButton *button1;

@property UIButton *button2;

@property PopupPickerButton *button3;

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
    
    self.button = [[PopupPickerButton alloc] initWithFrame:CGRectMake(170, 50, 150, 30)];
    self.button.backgroundColor = [UIColor darkGrayColor];
    [self.button setTitle:@"Select" forState:UIControlStateNormal];
    
    NSArray *list = [NSArray arrayWithObjects:[KeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"Q test"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"W test"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"E Test"],
                     nil];
    
    [self.button setOptions:list keyNames:[KeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button];
    
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
    
    self.button3 = [[PopupPickerButton alloc] initWithFrame:CGRectMake(170, self.view.bounds.size.height - 50, 150, 30)];
    self.button3.backgroundColor = [UIColor darkGrayColor];
    [self.button3 setTitle:@"Select" forState:UIControlStateNormal];
    [self.button3 setOptions:list keyNames:[KeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button3];
    
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
