//
//  Wallet.m
//  Wallet
//
//  Created by Sherpa on 11/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import "Wallet.h"
#import "Money.h"

@interface Wallet ()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation Wallet

- (NSUInteger) count{
    return [self.moneys count];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString*)currency{
    
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
}

- (id<Money>) times:(NSInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
 
    for (Money *each in newMoneys) {
        
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    
    self.moneys = newMoneys;
    return self;
}

- (id<Money>)plus:(Money*)money{
    
    [self.moneys addObject:money];
    return self;
}

- (Money*)reduceToCurrency:(NSString*)currency
                   withBroker:(Broker*)broker{
    
    Money *result = [[Money alloc] initWithAmount:0
                                         currency:currency];
    
    for (Money *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency
                                          withBroker:broker]];
    }
    
    return result;
    
}



@end
