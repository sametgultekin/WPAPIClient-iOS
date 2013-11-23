//
//  WPTagIndexResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPTagIndexResponse : NSObject <NSCoding> {
    NSNumber *tagCount;
    NSString *status;
    NSArray *tags;
}

@property (nonatomic, copy) NSNumber *tagCount;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSArray *tags;

+ (WPTagIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
