//
//  Wallet.h
//  Wallet
//
//  Created by Sherpa on 11/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject <Money>
@property (nonatomic, readonly) NSUInteger count;
@end
