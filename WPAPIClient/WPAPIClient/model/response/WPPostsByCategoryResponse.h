//
//  WPPostsByCategoryResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPCategory;

@interface WPPostsByCategoryResponse : NSObject <NSCoding> {
    WPCategory *category;
    NSNumber *postCount;
    NSNumber *pages;
    NSArray *posts;
    NSString *status;
}

@property (nonatomic, strong) WPCategory *category;
@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSArray *posts;
@property (nonatomic, copy) NSString *status;

+ (WPPostsByCategoryResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
