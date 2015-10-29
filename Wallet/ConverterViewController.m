//
//  ConverterViewController.m
//  Wallet
//
//  Created by Sherpa on 22/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "ConverterViewController.h"

@interface ConverterViewController()
{
    NSArray *names;
}
@end
@implementation ConverterViewController

#pragma mark - view life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    names = @[@"USD", @"EUR", @"MGF", @"ILS", @"TND", @"TRY"];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return names.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return names[row];
}

#pragma mark - UITextField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.quantityCurrencyTxt = textField;
}

//Implement resignOnTap:

- (void)resignOnTap:(id)iSender {
    [self.quantityCurrencyTxt resignFirstResponder];
}

- (IBAction)calcButtonPushed:(id)sender {
}
@end
