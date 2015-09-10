//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by Sherpa on 9/9/15.
//  Copyright (c) 2015 manuelainc. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
#import <objc/runtime.h>

@implementation NSObject (GNUStepAddons)

- (id) subclassResponsability: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ?  '+' : '-';
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass", NSStringFromClass([self class ]), prefix, NSStringFromSelector(aSel)];
    
    return self; //not reached

}


@end
