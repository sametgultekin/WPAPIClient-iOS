//
//  WPCategory.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPCategory.h"

@implementation WPCategory

@synthesize categoryID;
@synthesize descriptionText;
@synthesize parent;
@synthesize postCount;
@synthesize slug;
@synthesize title;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.categoryID forKey:@"categoryID"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.parent forKey:@"parent"];
    [encoder encodeObject:self.postCount forKey:@"postCount"];
    [encoder encodeObject:self.slug forKey:@"slug"];
    [encoder encodeObject:self.title forKey:@"title"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.categoryID = [decoder decodeObjectForKey:@"categoryID"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.parent = [decoder decodeObjectForKey:@"parent"];
        self.postCount = [decoder decodeObjectForKey:@"postCount"];
        self.slug = [decoder decodeObjectForKey:@"slug"];
        self.title = [decoder decodeObjectForKey:@"title"];
    }
    return self;
}

+ (WPCategory *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPCategory *instance = [[WPCategory alloc] init];
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

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"categoryID"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"post_count"]) {
        [self setValue:value forKey:@"postCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.categoryID) {
        [dictionary setObject:self.categoryID forKey:@"categoryID"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.parent) {
        [dictionary setObject:self.parent forKey:@"parent"];
    }

    if (self.postCount) {
        [dictionary setObject:self.postCount forKey:@"postCount"];
    }

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    return dictionary;

}

@end
