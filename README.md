MagnetPopupPicker <img src="https://travis-ci.org/ufukk/MagnetPopupPicker.svg?branch=master" />
=================

Simple and easy to use drop down substitution for IOS.

<<<<<<< HEAD
#Installation via CocoaPods:

		platform :ios, '7.0'
		pod 'MagnetPopupPicker'

#Usage: 
=======

Usage: 
>>>>>>> parent of d1dc515... Readme updated with CocoaPods information.

        self.button = [[PopupPickerButton alloc] initWithFrame:CGRectMake(11, 50, 150, 30)];

        [self.button setTitle:@"Select" forState:UIControlStateNormal];
    
        NSArray *list = [NSArray arrayWithObjects:[KeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"Test 1"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"Test 2"],
                     [KeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"Test 3"],
                     nil];
    
        [self.button setOptions:list keyNames:[KeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
