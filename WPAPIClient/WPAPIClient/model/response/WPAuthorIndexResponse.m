//
//  WPAuthorIndexResponse.m
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPAuthorIndexResponse.h"

#import "WPAuthor.h"

@implementation WPAuthorIndexResponse

@synthesize authors;
@synthesize authorCount;
@synthesize status;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.authors forKey:@"authors"];
    [encoder encodeObject:self.authorCount forKey:@"authorCount"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.authors = [decoder decodeObjectForKey:@"authors"];
        self.authorCount = [decoder decodeObjectForKey:@"authorCount"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}

+ (WPAuthorIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPAuthorIndexResponse *instance = [[WPAuthorIndexResponse alloc] init];
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

    if ([key isEqualToString:@"authors"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPAuthor *populatedMember = [WPAuthor instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.authors = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"authorCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.authors) {
        [dictionary setObject:self.authors forKey:@"authors"];
    }

    if (self.authorCount) {
        [dictionary setObject:self.authorCount forKey:@"authorCount"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;

}

@end
