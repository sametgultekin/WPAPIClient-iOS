//
//  WPCategoryIndexResponse.m
//  
//
//  Created by Samet Gultekin on 23/11/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "WPCategoryIndexResponse.h"

#import "WPCategory.h"

@implementation WPCategoryIndexResponse

@synthesize categories;
@synthesize categoryCount;
@synthesize status;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.categories forKey:@"categories"];
    [encoder encodeObject:self.categoryCount forKey:@"categoryCount"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.categories = [decoder decodeObjectForKey:@"categories"];
        self.categoryCount = [decoder decodeObjectForKey:@"categoryCount"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}

+ (WPCategoryIndexResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    WPCategoryIndexResponse *instance = [[WPCategoryIndexResponse alloc] init];
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

    if ([key isEqualToString:@"categories"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                WPCategory *populatedMember = [WPCategory instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.categories = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"count"]) {
        [self setValue:value forKey:@"categoryCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.categories) {
        [dictionary setObject:self.categories forKey:@"categories"];
    }

    if (self.categoryCount) {
        [dictionary setObject:self.categoryCount forKey:@"categoryCount"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;

}

@end
