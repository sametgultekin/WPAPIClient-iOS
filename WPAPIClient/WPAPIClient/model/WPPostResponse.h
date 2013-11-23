//
//  WPPostRequest.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPPost;

@interface WPPostResponse : NSObject <NSCoding> {
    NSString *nextUrl;
    WPPost *post;
    NSString *previousUrl;
    NSString *status;
}

@property (nonatomic, copy) NSString *nextUrl;
@property (nonatomic, strong) WPPost *post;
@property (nonatomic, copy) NSString *previousUrl;
@property (nonatomic, copy) NSString *status;

+ (WPPostResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
