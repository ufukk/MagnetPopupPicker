//
//  KeyValuePair.h
//  Whizz3.0
//
//  Created by ufuk on 4/8/14.
//  Copyright (c) 2014 Concept Imago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagnetKeyValuePair : NSObject

@property (nonatomic, readonly) NSString *key;

@property (nonatomic, readonly) id value;

+(MagnetKeyValuePair *)keyValuePairWithKeyAndValue:(NSString *)pkey value:(id)value;

-(id)initWithKeyValue:(NSString *)pKey value:(id) nValue;

@end
