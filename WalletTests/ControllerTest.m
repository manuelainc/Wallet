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
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllerTest : XCTestCase

@property (nonatomic,strong) SimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic, strong) WalletTableViewController *walletVC;
@property (nonatomic, strong) Wallet *wallet;
@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];

    //Test Button
    self.simpleVC = [[SimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;

    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[Money euroWithAmount:1]];
    self.walletVC = [[WalletTableViewController alloc] initWithModel:self.wallet];
    
}

- (void)tearDown {

    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    [super tearDown];
}

- (void) testThatTablehasOneSection{

    UITableView *tv = self.walletVC.tableView;
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:tv];
    
    XCTAssertEqual(sections, 1 , @"There can be only one");
}

- (void)testThatNumberOfCellsIsNumberOfMoneyPlusOne{
    
    UITableView *tv = self.walletVC.tableView;

    XCTAssertEqual(self.wallet.count + 1,
                   [self.walletVC tableView:tv numberOfRowsInSection:0],
                   @"Number of cells is the number of moneys plus 1 (the total)");
    
    
}

- (void)testThatTextOnLabelIsEqualToTextOnButton{
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //comprobamos  que etiqueta y boton tienen mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"button and label should have the same text");
    
}
@end
