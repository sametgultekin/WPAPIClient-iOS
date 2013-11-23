//
//  WPPost.h
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WPAuthor;
@class WPCustomFields;
@class WPPostRequestPostThumbnailImages;
@class WPImageSet;

@interface WPPost : NSObject <NSCoding> {
    NSArray *attachments;
    WPAuthor *author;
    NSArray *categories;
    NSNumber *commentCount;
    NSArray *comments;
    NSString *commentStatus;
    NSString *content;
    NSDictionary *customFields;
    NSString *date;
    NSString *excerpt;
    NSString *modified;
    NSString *slug;
    NSString *status;
    NSArray *tags;
    NSString *thumbnail;
    WPImageSet *thumbnailImages;
    NSString *thumbnailSize;
    NSString *title;
    NSString *titlePlain;
    NSString *type;
    NSString *url;
    NSNumber *postID;
}

@property (nonatomic, copy) NSArray *attachments;
@property (nonatomic, strong) WPAuthor *author;
@property (nonatomic, copy) NSArray *categories;
@property (nonatomic, copy) NSNumber *commentCount;
@property (nonatomic, copy) NSArray *comments;
@property (nonatomic, copy) NSString *commentStatus;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSDictionary *customFields;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *excerpt;
@property (nonatomic, copy) NSString *modified;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, strong) WPImageSet *thumbnailImages;
@property (nonatomic, copy) NSString *thumbnailSize;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titlePlain;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *postID;

+ (WPPost *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
