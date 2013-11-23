//
//  WPTag.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPTag.h"

@implementation WPTag

@synthesize descriptionText;
@synthesize postCount;
@synthesize slug;
@synthesize tagID;
@synthesize title;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.postCount forKey:@"postCount"];
    [encoder encodeObject:self.slug forKey:@"slug"];
    [encoder encodeObject:self.tagID forKey:@"tagID"];
    [encoder encodeObject:self.title forKey:@"title"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.postCount = [decoder decodeObjectForKey:@"postCount"];
        self.slug = [decoder decodeObjectForKey:@"slug"];
        self.tagID = [decoder decodeObjectForKey:@"tagID"];
        self.title = [decoder decodeObjectForKey:@"title"];
    }
    return self;
}

+ (WPTag *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPTag *instance = [[WPTag alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"post_count"]) {
        [self setValue:value forKey:@"postCount"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"tagID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.postCount) {
        [dictionary setObject:self.postCount forKey:@"postCount"];
    }

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    if (self.tagID) {
        [dictionary setObject:self.tagID forKey:@"tagID"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    return dictionary;

}

@end
