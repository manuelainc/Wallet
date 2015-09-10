//
//  Money.m
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

@interface Money ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation Money

+(id) euroWithAmount:(NSInteger)amount{
    
    
    
    return [[Money alloc]initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger)amount{

    return [[Money alloc]initWithAmount:amount currency:@"USD"];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
    
}

- (id) times:(NSInteger)multiplier{

    Money *newMoney = [[Money alloc] initWithAmount:[self.amount integerValue] * multiplier
                                           currency:self.currency];
        
    return newMoney;
    
    //no se deberia llamar , sino que se deberia
    //de usar el de la subclase
   // return [self subclassResponsability: _cmd]; //_cmd get parameter actual selector
}

- (id)plus:(Money*)other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    Money *total = [[Money alloc] initWithAmount:totalAmount
                                        currency:self.currency];

    return total;
}

#pragma mark - OverWritten methods
- (NSString *)description{
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
}

- (BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

- (NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}

@end
