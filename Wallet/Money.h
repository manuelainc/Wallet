//
//  Money.h
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger)amount;
+(id) dollarWithAmount:(NSInteger)amount;

- (id)initWithAmount:(NSInteger)amount currency:(NSString*)currency;
- (id) times:(NSInteger)multiplier;
- (id)plus:(Money*)other;

@end
