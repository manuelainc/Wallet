//
//  ControllerTest.m
//  Wallet
//
//  Created by Sherpa on 13/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SimpleViewController.h"

@interface ControllerTest : XCTestCase

@property (nonatomic,strong) SimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];

    self.simpleVC = [[SimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
}

- (void)tearDown {

    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    [super tearDown];
}

- (void)testThatTextOnLabelIsEqualToTextOnButton{
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //comprobamos  que etiqueta y boton tienen mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"button and label should have the same text");
    
}
@end
