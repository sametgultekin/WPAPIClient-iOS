//
//  WPImage.m
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import "WPImage.h"

@implementation WPImage
@synthesize height;
@synthesize url;
@synthesize width;
@synthesize imageSize;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeObject:self.url forKey:@"url"];
    [encoder encodeObject:self.width forKey:@"width"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.imageSize] forKey:@"imageSize"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.height = [decoder decodeObjectForKey:@"height"];
        self.url = [decoder decodeObjectForKey:@"url"];
        self.width = [decoder decodeObjectForKey:@"width"];
        self.imageSize = [[decoder decodeObjectForKey:@"imageSize"] integerValue];
    }
    return self;
}

+ (WPImage *)instanceFromDictionary:(NSDictionary *)aDictionary{
    WPImage *instance = [[WPImage alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    [self setValuesForKeysWithDictionary:aDictionary];
}

- (NSDictionary *)dictionaryRepresentation{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.height) {
        [dictionary setObject:self.height forKey:@"height"];
    }
    
    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }
    
    if (self.width) {
        [dictionary setObject:self.width forKey:@"width"];
    }
    
    if (self.imageSize) {
        [dictionary setObject:[NSNumber numberWithInteger:imageSize] forKey:@"imageSize"];
    }
    
    return dictionary;
    
}


@end







