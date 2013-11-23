//
//  WPTagIndexResponse.m
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPTagIndexResponse.h"

#import "WPTag.h"

@implementation WPTagIndexResponse

@synthesize tagCount;
@synthesize status;
@synthesize tags;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.tagCount forKey:@"tagCount"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.tags forKey:@"tags"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.tagCount = [decoder decodeObjectForKey:@"tagCount"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.tags = [decoder decodeObjectForKey:@"tags"];
    }
    return self;
}

+ (WPTagIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPTagIndexResponse *instance = [[WPTagIndexResponse alloc] init];
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

    if ([key isEqualToString:@"tags"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPTag *populatedMember = [WPTag instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.tags = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"tagCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.tagCount) {
        [dictionary setObject:self.tagCount forKey:@"tagCount"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    if (self.tags) {
        [dictionary setObject:self.tags forKey:@"tags"];
    }

    return dictionary;

}

@end
