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
    
    self.button = [[PopupPickerButton alloc] initWithFrame:CGRectMake(20, 120, 200, 100)];
    self.button.backgroundColor = [UIColor darkGrayColor];
    [self.button setTitle:@"Select" forState:UIControlStateNormal];
    
    NSArray *list = [NSArray arrayWithObjects:[KeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"Test 1"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"Test 2"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"Test 3"],
                     nil];
    
    [self.button setOptions:list keyNames:[KeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button];
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
