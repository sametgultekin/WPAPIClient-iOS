//
//  WPPost.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPPost.h"

#import "WPAttachment.h"
#import "WPAuthor.h"
#import "WPCategory.h"
#import "WPComment.h"
#import "WPTag.h"
#import "WPImageSet.h"

@implementation WPPost

@synthesize attachments;
@synthesize author;
@synthesize categories;
@synthesize commentCount;
@synthesize comments;
@synthesize commentStatus;
@synthesize content;
@synthesize customFields;
@synthesize date;
@synthesize excerpt;
@synthesize modified;
@synthesize slug;
@synthesize status;
@synthesize tags;
@synthesize thumbnail;
@synthesize thumbnailImages;
@synthesize thumbnailSize;
@synthesize title;
@synthesize titlePlain;
@synthesize type;
@synthesize url;
@synthesize postID;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.attachments forKey:@"attachments"];
    [encoder encodeObject:self.author forKey:@"author"];
    [encoder encodeObject:self.categories forKey:@"categories"];
    [encoder encodeObject:self.commentCount forKey:@"commentCount"];
    [encoder encodeObject:self.comments forKey:@"comments"];
    [encoder encodeObject:self.commentStatus forKey:@"commentStatus"];
    [encoder encodeObject:self.content forKey:@"content"];
    [encoder encodeObject:self.customFields forKey:@"customFields"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.excerpt forKey:@"excerpt"];
    [encoder encodeObject:self.modified forKey:@"modified"];
    [encoder encodeObject:self.slug forKey:@"slug"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.tags forKey:@"tags"];
    [encoder encodeObject:self.thumbnail forKey:@"thumbnail"];
    [encoder encodeObject:self.thumbnailImages forKey:@"thumbnailImages"];
    [encoder encodeObject:self.thumbnailSize forKey:@"thumbnailSize"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.titlePlain forKey:@"titlePlain"];
    [encoder encodeObject:self.type forKey:@"type"];
    [encoder encodeObject:self.url forKey:@"url"];
    [encoder encodeObject:self.postID forKey:@"postID"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.attachments = [decoder decodeObjectForKey:@"attachments"];
        self.author = [decoder decodeObjectForKey:@"author"];
        self.categories = [decoder decodeObjectForKey:@"categories"];
        self.commentCount = [decoder decodeObjectForKey:@"commentCount"];
        self.comments = [decoder decodeObjectForKey:@"comments"];
        self.commentStatus = [decoder decodeObjectForKey:@"commentStatus"];
        self.content = [decoder decodeObjectForKey:@"content"];
        self.customFields = [decoder decodeObjectForKey:@"customFields"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.excerpt = [decoder decodeObjectForKey:@"excerpt"];
        self.modified = [decoder decodeObjectForKey:@"modified"];
        self.slug = [decoder decodeObjectForKey:@"slug"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.tags = [decoder decodeObjectForKey:@"tags"];
        self.thumbnail = [decoder decodeObjectForKey:@"thumbnail"];
        self.thumbnailImages = [decoder decodeObjectForKey:@"thumbnailImages"];
        self.thumbnailSize = [decoder decodeObjectForKey:@"thumbnailSize"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.titlePlain = [decoder decodeObjectForKey:@"titlePlain"];
        self.type = [decoder decodeObjectForKey:@"type"];
        self.url = [decoder decodeObjectForKey:@"url"];
        self.postID = [decoder decodeObjectForKey:@"postID"];
    }
    return self;
}

+ (WPPost *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPPost *instance = [[WPPost alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"attachments"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPAttachment *populatedMember = [WPAttachment instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.attachments = myMembers;

        }

    } else if ([key isEqualToString:@"author"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.author = [WPAuthor instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"categories"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPCategory *populatedMember = [WPCategory instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.categories = myMembers;

        }

    } else if ([key isEqualToString:@"comments"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPComment *populatedMember = [WPComment instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.comments = myMembers;

        }

    } else if ([key isEqualToString:@"custom_fields"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.customFields = (NSDictionary*)value;
        }

    } else if ([key isEqualToString:@"tags"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPTag *populatedMember = [WPTag instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.tags = myMembers;

        }

    } else if ([key isEqualToString:@"thumbnail_images"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnailImages = [WPImageSet instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"comment_count"]) {
        [self setValue:value forKey:@"commentCount"];
    } else if ([key isEqualToString:@"comment_status"]) {
        [self setValue:value forKey:@"commentStatus"];
    } else if ([key isEqualToString:@"custom_fields"]) {
        [self setValue:value forKey:@"customFields"];
    } else if ([key isEqualToString:@"thumbnail_images"]) {
        [self setValue:value forKey:@"thumbnailImages"];
    } else if ([key isEqualToString:@"thumbnail_size"]) {
        [self setValue:value forKey:@"thumbnailSize"];
    } else if ([key isEqualToString:@"title_plain"]) {
        [self setValue:value forKey:@"titlePlain"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"postID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.attachments) {
        [dictionary setObject:self.attachments forKey:@"attachments"];
    }

    if (self.author) {
        [dictionary setObject:self.author forKey:@"author"];
    }

    if (self.categories) {
        [dictionary setObject:self.categories forKey:@"categories"];
    }

    if (self.commentCount) {
        [dictionary setObject:self.commentCount forKey:@"commentCount"];
    }

    if (self.comments) {
        [dictionary setObject:self.comments forKey:@"comments"];
    }

    if (self.commentStatus) {
        [dictionary setObject:self.commentStatus forKey:@"commentStatus"];
    }

    if (self.content) {
        [dictionary setObject:self.content forKey:@"content"];
    }

    if (self.customFields) {
        [dictionary setObject:self.customFields forKey:@"customFields"];
    }

    if (self.date) {
        [dictionary setObject:self.date forKey:@"date"];
    }

    if (self.excerpt) {
        [dictionary setObject:self.excerpt forKey:@"excerpt"];
    }

    if (self.modified) {
        [dictionary setObject:self.modified forKey:@"modified"];
    }

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    if (self.tags) {
        [dictionary setObject:self.tags forKey:@"tags"];
    }

    if (self.thumbnail) {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
    }

    if (self.thumbnailImages) {
        [dictionary setObject:self.thumbnailImages forKey:@"thumbnailImages"];
    }

    if (self.thumbnailSize) {
        [dictionary setObject:self.thumbnailSize forKey:@"thumbnailSize"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    if (self.titlePlain) {
        [dictionary setObject:self.titlePlain forKey:@"titlePlain"];
    }

    if (self.type) {
        [dictionary setObject:self.type forKey:@"type"];
    }

    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }

    if (self.postID) {
        [dictionary setObject:self.postID forKey:@"postID"];
    }

    return dictionary;

}

@end
