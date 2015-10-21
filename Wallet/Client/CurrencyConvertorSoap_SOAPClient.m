//
//  CurrencyConvertorSoap_SOAPClient.m
//  Wallet
//
//  Created by Sherpa on 21/10/15.
//  Copyright © 2015 manuelainc. All rights reserved.
//

#import "CurrencyConvertorSoap_SOAPClient.h"

@implementation CurrencyConvertorSoap_SOAPClient

-(void)conversionRate:(ConversionRate *) requestObject
              success:(void (^)(ConversionRateResponse *responseObject))success
              failure:(void (^)(NSError *error, id<PicoBindable> soapFault))failure {
    
    [super setDefaultHeader:@"SOAPAction" value: @"http://www.webserviceX.NET/ConversionRate"];
    
    [super invoke:requestObject responseClass:[ConversionRateResponse class]
          success:^(PicoSOAPRequestOperation *operation, id<PicoBindable> responseObject) {
              if (success) {
                  success(responseObject);
              }
          } failure:^(PicoSOAPRequestOperation *operation, NSError *error, id<PicoBindable> soapFault) {
              if (failure) {
                  failure(error, soapFault);
              }
          }];
}


@end
