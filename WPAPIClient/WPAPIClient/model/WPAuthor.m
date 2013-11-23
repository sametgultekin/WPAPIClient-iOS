//
//  WPAuthor.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPAuthor.h"

@implementation WPAuthor

@synthesize authorID;
@synthesize descriptionText;
@synthesize firstName;
@synthesize lastName;
@synthesize name;
@synthesize nickname;
@synthesize slug;
@synthesize url;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.authorID forKey:@"authorID"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.nickname forKey:@"nickname"];
    [encoder encodeObject:self.slug forKey:@"slug"];
    [encoder encodeObject:self.url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.authorID = [decoder decodeObjectForKey:@"authorID"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.firstName = [decoder decodeObjectForKey:@"firstName"];
        self.lastName = [decoder decodeObjectForKey:@"lastName"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.nickname = [decoder decodeObjectForKey:@"nickname"];
        self.slug = [decoder decodeObjectForKey:@"slug"];
        self.url = [decoder decodeObjectForKey:@"url"];
    }
    return self;
}

+ (WPAuthor *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPAuthor *instance = [[WPAuthor alloc] init];
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
        [self setValue:value forKey:@"authorID"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"first_name"]) {
        [self setValue:value forKey:@"firstName"];
    } else if ([key isEqualToString:@"last_name"]) {
        [self setValue:value forKey:@"lastName"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.authorID) {
        [dictionary setObject:self.authorID forKey:@"authorID"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.firstName) {
        [dictionary setObject:self.firstName forKey:@"firstName"];
    }

    if (self.lastName) {
        [dictionary setObject:self.lastName forKey:@"lastName"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.nickname) {
        [dictionary setObject:self.nickname forKey:@"nickname"];
    }

    if (self.slug) {
        [dictionary setObject:self.slug forKey:@"slug"];
    }

    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }

    return dictionary;

}

@end
