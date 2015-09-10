//
//  MoneyTest.m
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Money.h"

@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

- (void)testCurrencies{
    
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency], @"The currency of Euros shoud be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency], @"The currency of Dollar shoud be USD");

}

- (void)testMultiplication{
    
    Money *euro = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [euro times:2];
    
    
    XCTAssertEqualObjects(ten, total, @"Both should be equal");
    
}

- (void) testEquality{
    Money *five = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    
    Money *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @" Equivalent objects should be equal");
    XCTAssertEqualObjects([Money dollarWithAmount:4], [[Money dollarWithAmount:2] times:2] , @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Not equivalent object should not be equal");
    
}

- (void)testDifferentCurrenies{
    
    Money *euro = [Money euroWithAmount:1];
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal!");
}

- (void)testHash{
    Money *a = [Money euroWithAmount:2];
    Money *b = [Money euroWithAmount:2];
    
    XCTAssertEqual(a.hash, b.hash, @"Equal object must have same hash");
    XCTAssertEqual([[Money dollarWithAmount:1] hash], [[Money dollarWithAmount:1] hash], @"Equal object must have same hash");

}

- (void)testAmountStorage{
    
    Money *euro = [Money euroWithAmount:2];
    
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    XCTAssertEqual(2, [[[Money dollarWithAmount:2]performSelector:@selector(amount)]integerValue] ,  @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}


- (void)testSimpleAddition{
    
    XCTAssertEqualObjects([[Money dollarWithAmount:5] plus:[Money dollarWithAmount:5]], [Money dollarWithAmount:10], @"$5 + $5 = $10");
}


@end
