//
//  WPPostsByTagResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPTag;

@interface WPPostsByTagResponse : NSObject <NSCoding> {
    NSNumber *postCount;
    NSNumber *pages;
    NSArray *posts;
    NSString *status;
    WPTag *tag;
}

@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSArray *posts;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) WPTag *tag;

+ (WPPostsByTagResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
