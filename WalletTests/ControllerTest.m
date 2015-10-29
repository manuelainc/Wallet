//
//  ControllerTest.m
//  Wallet
//
//  Created by Sherpa on 13/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Wallet.h"

@interface ControllerTest : XCTestCase

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic, strong) Wallet *wallet;
@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];


    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[Money euroWithAmount:1]];
    
}

- (void)tearDown {

    [super tearDown];
}



@end
