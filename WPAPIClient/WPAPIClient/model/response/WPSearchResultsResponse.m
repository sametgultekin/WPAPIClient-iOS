//
//  WPSearchResultsResponse.m
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPSearchResultsResponse.h"

#import "WPPost.h"

@implementation WPSearchResultsResponse

@synthesize postCount;
@synthesize postCountTotal;
@synthesize pages;
@synthesize posts;
@synthesize status;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.postCount forKey:@"postCount"];
    [encoder encodeObject:self.postCountTotal forKey:@"postCountTotal"];
    [encoder encodeObject:self.pages forKey:@"pages"];
    [encoder encodeObject:self.posts forKey:@"posts"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.postCount = [decoder decodeObjectForKey:@"postCount"];
        self.postCountTotal = [decoder decodeObjectForKey:@"postCountTotal"];
        self.pages = [decoder decodeObjectForKey:@"pages"];
        self.posts = [decoder decodeObjectForKey:@"posts"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}

+ (WPSearchResultsResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPSearchResultsResponse *instance = [[WPSearchResultsResponse alloc] init];
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

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"postCount"];
    } else if ([key isEqualToString:@"count_total"]) {
        [self setValue:value forKey:@"postCountTotal"];
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

    if (self.postCountTotal) {
        [dictionary setObject:self.postCountTotal forKey:@"postCountTotal"];
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

    return dictionary;

}

@end
