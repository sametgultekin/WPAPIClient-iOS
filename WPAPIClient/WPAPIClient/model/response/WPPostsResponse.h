//
//  WPPostsResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WPPostsResponse : NSObject <NSCoding> {
    NSNumber *postCount;
    NSNumber *postCountTotal;
    NSNumber *pages;
    NSArray *posts;
    NSDictionary *query;
    NSString *status;
}

@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSNumber *postCountTotal;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSArray *posts;
@property (nonatomic, strong) NSDictionary *query;
@property (nonatomic, copy) NSString *status;

+ (WPPostsResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
