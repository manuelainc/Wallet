//
//  Money.m
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import "Money.h"
#import "Broker.h"
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

- (id<Money>) times:(NSInteger)multiplier{

    Money *newMoney = [[Money alloc] initWithAmount:[self.amount integerValue] * multiplier
                                           currency:self.currency];
        
    return newMoney;
    
    //no se deberia llamar , sino que se deberia
    //de usar el de la subclase
   // return [self subclassResponsability: _cmd]; //_cmd get parameter actual selector
}

- (id<Money>)plus:(Money*)other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    Money *total = [[Money alloc] initWithAmount:totalAmount
                                        currency:self.currency];

    return total;
}

- (id<Money>)reduceToCurrency:(NSString*) currency withBroker:(Broker*) broker{
    
    Money *result;
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]] doubleValue];
    
    //comprobamos que divisa de origen y de destino son las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        //No hay tasa de conversion, lanza exception
        [NSException raise:@"NoConversionRateException"
                    format:@"Must to have a conversion from %@ to %@", self.currency, currency];
    }else{
        //Tenemos conversion
        double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount currency:currency];
    }
    
    
    
    return result;

    
}


#pragma mark - OverWritten methods
- (NSString *)description{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], [self currency], [self amount]];
}

- (BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

- (NSUInteger) hash{
    
    return [self.amount integerValue];
}

@end
