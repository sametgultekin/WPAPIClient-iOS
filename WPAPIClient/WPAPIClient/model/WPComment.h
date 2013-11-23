//
//  WPComment.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPAuthor;

@interface WPComment : NSObject <NSCoding> {
    WPAuthor *author;
    NSNumber *commentID;
    NSString *content;
    NSString *date;
    NSString *name;
    NSNumber *parent;
    NSString *url;
}

@property (nonatomic, strong) WPAuthor *author;
@property (nonatomic, copy) NSNumber *commentID;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *parent;
@property (nonatomic, copy) NSString *url;

+ (WPComment *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
