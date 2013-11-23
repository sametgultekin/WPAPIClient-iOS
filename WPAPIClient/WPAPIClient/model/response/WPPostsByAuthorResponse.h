//
//  WPPostsByAuthorResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPAuthor;

@interface WPPostsByAuthorResponse : NSObject <NSCoding> {
    WPAuthor *author;
    NSNumber *postCount;
    NSNumber *pages;
    NSArray *posts;
    NSString *status;
}

@property (nonatomic, strong) WPAuthor *author;
@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSArray *posts;
@property (nonatomic, copy) NSString *status;

+ (WPPostsByAuthorResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
