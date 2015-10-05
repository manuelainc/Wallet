//
//  SimpleViewController.h
//  Wallet
//
//  Created by Sherpa on 13/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)displayText:(id)sender;

@end
