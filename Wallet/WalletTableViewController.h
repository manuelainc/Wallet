//
//  WalletTableViewController.h
//  Wallet
//
//  Created by Sherpa on 5/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController

- (id) initWithModel:(Wallet*) model;
@end
