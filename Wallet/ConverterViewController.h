//
//  ConverterViewController.h
//  Wallet
//
//  Created by Sherpa on 22/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConverterViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *quantityCurrencyTxt;
@property (strong, nonatomic) IBOutlet UIPickerView *fromPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *toPicker;
@property (strong, nonatomic) IBOutlet UIButton *calcBtn;
@property (strong, nonatomic) IBOutlet UILabel *resultLbl;
- (IBAction)calcButtonPushed:(id)sender;
@end
