//
//  WPPostsByDateResponse.h
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPPostsByDateResponse : NSObject <NSCoding> {
    NSNumber *postCount;
    NSNumber *postCountTotal;
    NSNumber *pages;
    NSArray *posts;
    NSString *status;
}

@property (nonatomic, copy) NSNumber *postCount;
@property (nonatomic, copy) NSNumber *postCountTotal;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSArray *posts;
@property (nonatomic, copy) NSString *status;

+ (WPPostsByDateResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
