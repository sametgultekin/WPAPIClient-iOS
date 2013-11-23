//
//  WPPostRequest.m
//  
//
//  Created by Samet Gultekin on 21/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPPostResponse.h"

#import "WPPost.h"

@implementation WPPostResponse

@synthesize nextUrl;
@synthesize post;
@synthesize previousUrl;
@synthesize status;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.nextUrl forKey:@"nextUrl"];
    [encoder encodeObject:self.post forKey:@"post"];
    [encoder encodeObject:self.previousUrl forKey:@"previousUrl"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.nextUrl = [decoder decodeObjectForKey:@"nextUrl"];
        self.post = [decoder decodeObjectForKey:@"post"];
        self.previousUrl = [decoder decodeObjectForKey:@"previousUrl"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}

+ (WPPostResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPPostResponse *instance = [[WPPostResponse alloc] init];
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

    if ([key isEqualToString:@"post"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.post = [WPPost instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"next_url"]) {
        [self setValue:value forKey:@"nextUrl"];
    } else if ([key isEqualToString:@"previous_url"]) {
        [self setValue:value forKey:@"previousUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.nextUrl) {
        [dictionary setObject:self.nextUrl forKey:@"nextUrl"];
    }

    if (self.post) {
        [dictionary setObject:self.post forKey:@"post"];
    }

    if (self.previousUrl) {
        [dictionary setObject:self.previousUrl forKey:@"previousUrl"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;

}

@end
