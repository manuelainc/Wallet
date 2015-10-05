//
//  Money.h
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;
@protocol Money <NSObject>

- (id)initWithAmount:(NSInteger)amount currency:(NSString*)currency;
- (id<Money>) times:(NSInteger)multiplier;
- (id<Money>)plus:(Money*)other;
- (id<Money>)reduceToCurrency:(NSString*) currency withBroker:(Broker*) broker;

@end

@interface Money : NSObject <Money>


@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;


+(id) euroWithAmount:(NSInteger)amount;
+(id) dollarWithAmount:(NSInteger)amount;


@end
