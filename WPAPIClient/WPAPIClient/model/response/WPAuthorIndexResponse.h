//
//  WPAuthorIndexResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPAuthorIndexResponse : NSObject <NSCoding> {
    NSArray *authors;
    NSNumber *authorCount;
    NSString *status;
}

@property (nonatomic, copy) NSArray *authors;
@property (nonatomic, copy) NSNumber *authorCount;
@property (nonatomic, copy) NSString *status;

+ (WPAuthorIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
