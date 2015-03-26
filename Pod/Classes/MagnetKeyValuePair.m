//
//  KeyValuePair.m
//  Whizz3.0
//
//  Created by ufuk on 4/8/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import "MagnetKeyValuePair.h"

@implementation MagnetKeyValuePair

+(MagnetKeyValuePair *)keyValuePairWithKeyAndValue:(NSString *)pkey value:(id)value
{
    return [[MagnetKeyValuePair alloc] initWithKeyValue:pkey value:value];
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
    if(![object isKindOfClass:[MagnetKeyValuePair class]])
        return NO;
    MagnetKeyValuePair *p = (MagnetKeyValuePair *)object;
    return ([p.key isEqual:self.key] && [p.value isEqual:self.value]);
}

@end
