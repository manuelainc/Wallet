//
//  CurrencyConvertorSoap_SOAPClient.h
//  Wallet
//
//  Created by Sherpa on 21/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PicoSOAPClient.h"
#import "ConversionRate.h"
#import "ConversionRateResponse.h"

@interface CurrencyConvertorSoap_SOAPClient : PicoSOAPClient

-(void)conversionRate:(ConversionRate *) requestObject
              success:(void (^)(ConversionRateResponse *responseObject))success
              failure:(void (^)(NSError *error, id<PicoBindable> soapFault))failure;


@end
