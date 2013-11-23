//
//  WPAttachment.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPAttachment.h"

#import "WPImageSet.h"

@implementation WPAttachment

@synthesize attachmentID;
@synthesize caption;
@synthesize descriptionText;
@synthesize images;
@synthesize imageSet;
@synthesize mimeType;
@synthesize parent;
@synthesize slug;
@synthesize title;
@synthesize url;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.attachmentID forKey:@"attachmentID"];
    [encoder encodeObject:self.caption forKey:@"caption"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.images forKey:@"images"];
    [encoder encodeObject:self forKey:@"imageSet"];
    [encoder encodeObject:self.mimeType forKey:@"mimeType"];
    [encoder encodeObject:self.parent forKey:@"parent"];
    [encoder encodeObject:self.slug forKey:@"slug"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.attachmentID = [decoder decodeObjectForKey:@"attachmentID"];
        self.caption = [decoder decodeObjectForKey:@"caption"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.images = [decoder decodeObjectForKey:@"images"];
        self.imageSet = [decoder decodeObjectForKey:@"imageSet"];
        self.mimeType = [decoder decodeObjectForKey:@"mimeType"];
        self.parent = [decoder decodeObjectForKey:@"parent"];
        self.slug = [decoder decodeObjectForKey:@"slug"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.url = [decoder decodeObjectForKey:@"url"];
    }
    return self;
}

+ (WPAttachment *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPAttachment *instance = [[WPAttachment alloc] init];
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

    if ([key isEqualToString:@"images"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            //self.images = [AttachmentImages instanceFromDictionary:value];
            self.imageSet = [WPImageSet instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"attachmentID"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"mime_type"]) {
        [self setValue:value forKey:@"mimeType"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.attachmentID) {
        [dictionary setObject:self.attachmentID forKey:@"attachmentID"];
    }

    if (self.caption) {
        [dictionary setObject:self.caption forKey:@"caption"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.images) {
        [dictionary setObject:self.images forKey:@"images"];
    }

    if (self.mimeType) {
        [dictionary setObject:self.mimeType forKey:@"mimeType"];
    }

    if (self.parent) {
        [dictionary setObject:self.parent forKey:@"parent"];
    }

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }

    return dictionary;

}

@end
