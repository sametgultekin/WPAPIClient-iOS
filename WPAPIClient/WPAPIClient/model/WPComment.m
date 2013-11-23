//
//  WPComment.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPComment.h"

#import "WPAuthor.h"

@implementation WPComment

@synthesize author;
@synthesize commentID;
@synthesize content;
@synthesize date;
@synthesize name;
@synthesize parent;
@synthesize url;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.author forKey:@"author"];
    [encoder encodeObject:self.commentID forKey:@"commentID"];
    [encoder encodeObject:self.content forKey:@"content"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.parent forKey:@"parent"];
    [encoder encodeObject:self.url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.author = [decoder decodeObjectForKey:@"author"];
        self.commentID = [decoder decodeObjectForKey:@"commentID"];
        self.content = [decoder decodeObjectForKey:@"content"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.parent = [decoder decodeObjectForKey:@"parent"];
        self.url = [decoder decodeObjectForKey:@"url"];
    }
    return self;
}

+ (WPComment *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPComment *instance = [[WPComment alloc] init];
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

    if ([key isEqualToString:@"author"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.author = [WPAuthor instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"commentID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.author) {
        [dictionary setObject:self.author forKey:@"author"];
    }

    if (self.commentID) {
        [dictionary setObject:self.commentID forKey:@"commentID"];
    }

    if (self.content) {
        [dictionary setObject:self.content forKey:@"content"];
    }

    if (self.date) {
        [dictionary setObject:self.date forKey:@"date"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.parent) {
        [dictionary setObject:self.parent forKey:@"parent"];
    }

    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }

    return dictionary;

}

@end
