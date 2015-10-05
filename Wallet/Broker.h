//
//  Broker.h
//  Wallet
//
//  Created by Sherpa on 11/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Broker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

- (Money*)reduce:(id<Money>) money toCurrency:(NSString*) currency;

- (void)addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency;
- (NSString*)keyFromCurrency:(NSString*)fromCurrency
                  toCurrency:(NSString*)toCurrency;

@end
