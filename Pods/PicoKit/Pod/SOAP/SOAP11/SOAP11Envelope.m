// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "SOAP11Envelope.h"
#import "SOAP11Header.h"
#import "SOAP11Body.h"
#import "OrderedDictionary.h"

@implementation SOAP11Envelope

@synthesize header = _header;
@synthesize body = _body;
@synthesize any = _any;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"Envelope" nsUri:@"http://schemas.xmlsoap.org/soap/envelope/"];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [OrderedDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Header" propertyName:@"header" type:PICO_TYPE_OBJECT clazz:[SOAP11Header class]];
    map[@"header"] = ps;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Body" propertyName:@"body" type:PICO_TYPE_OBJECT clazz:[SOAP11Body class]];
    map[@"body"] = ps;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    map[@"any"] = ps;
    
    return map;
}




@end