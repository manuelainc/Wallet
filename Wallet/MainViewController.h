//
//  ViewController.h
//  Wallet
//
//  Created by Sherpa on 7/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController


@property (retain, nonatomic) IBOutlet UITextField *fromCurrencyTextField;
@property (retain, nonatomic) IBOutlet UITextField *toCurrencyTextField;
@property (retain, nonatomic) IBOutlet UIButton *convertButton;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
