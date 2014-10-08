//
//  KeyValuePair.m
//  Whizz3.0
//
//  Created by ufuk on 4/8/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "KeyValuePair.h"

@implementation KeyValuePair

+(KeyValuePair *)keyValuePairWithKeyAndValue:(NSString *)pkey value:(id)value
{
    return [[KeyValuePair alloc] initWithKeyValue:pkey value:value];
}

-(id)initWithKeyValue:(NSString *)pKey value:(id)nValue
{
    if(self = [super init])
    {
        _key = pKey;
        _value = nValue;
    }
    return self;
}

-(BOOL)isEqual:(id)object
{
    if(object == self)
        return YES;
    if(![object isKindOfClass:[KeyValuePair class]])
        return NO;
    KeyValuePair *p = (KeyValuePair *)object;
    return ([p.key isEqual:self.key] && [p.value isEqual:self.value]);
}

@end
