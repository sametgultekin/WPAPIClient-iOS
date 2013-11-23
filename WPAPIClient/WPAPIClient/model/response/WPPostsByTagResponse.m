//
//  WPPostsByTagResponse.m
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPPostsByTagResponse.h"

#import "WPPost.h"
#import "WPTag.h"

@implementation WPPostsByTagResponse

@synthesize postCount;
@synthesize pages;
@synthesize posts;
@synthesize status;
@synthesize tag;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.postCount forKey:@"postCount"];
    [encoder encodeObject:self.pages forKey:@"pages"];
    [encoder encodeObject:self.posts forKey:@"posts"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.tag forKey:@"tag"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.postCount = [decoder decodeObjectForKey:@"postCount"];
        self.pages = [decoder decodeObjectForKey:@"pages"];
        self.posts = [decoder decodeObjectForKey:@"posts"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.tag = [decoder decodeObjectForKey:@"tag"];
    }
    return self;
}

+ (WPPostsByTagResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPPostsByTagResponse *instance = [[WPPostsByTagResponse alloc] init];
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

    if ([key isEqualToString:@"posts"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPPost *populatedMember = [WPPost instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.posts = myMembers;

        }

    } else if ([key isEqualToString:@"tag"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.tag = [WPTag instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"postCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.postCount) {
        [dictionary setObject:self.postCount forKey:@"postCount"];
    }

    if (self.pages) {
        [dictionary setObject:self.pages forKey:@"pages"];
    }

    if (self.posts) {
        [dictionary setObject:self.posts forKey:@"posts"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    if (self.tag) {
        [dictionary setObject:self.tag forKey:@"tag"];
    }

    return dictionary;

}

@end
