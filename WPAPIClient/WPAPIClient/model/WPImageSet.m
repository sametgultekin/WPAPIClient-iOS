//
//  WPImageSet.m
//  WP-API
//
//  Created by Samet Gültekin on 22/11/13.
//
//

#import "WPImageSet.h"
#import "WPImage.h"

@implementation WPImageSet

@synthesize fullSizeImage;
@synthesize mediumSizeImage;
@synthesize postThumbnailSizeImage;
@synthesize thumbnailSizeImage;


- (void)encodeWithCoder:(NSCoder *)encoder{
    
    [encoder encodeObject:self.fullSizeImage forKey:@"fullSizeImage"];
    [encoder encodeObject:self.mediumSizeImage forKey:@"mediumSizeImage"];
    [encoder encodeObject:self.postThumbnailSizeImage forKey:@"postThumbnailSizeImage"];
    [encoder encodeObject:self.thumbnailSizeImage forKey:@"thumbnailSizeImage"];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.fullSizeImage = [decoder decodeObjectForKey:@"fullSizeImage"];
        self.mediumSizeImage = [decoder decodeObjectForKey:@"mediumSizeImage"];
        self.postThumbnailSizeImage = [decoder decodeObjectForKey:@"postThumbnailSizeImage"];
        self.thumbnailSizeImage = [decoder decodeObjectForKey:@"thumbnailSizeImage"];
    }
    return self;
}


+ (WPImageSet *)instanceFromDictionary:(NSDictionary *)aDictionary{
    
    WPImageSet *instance = [[WPImageSet alloc] init];
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
    
    if ([key isEqualToString:@"full"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.fullSizeImage = [WPImage instanceFromDictionary:value];
            self.fullSizeImage.imageSize = WPImageSizeFull;
        }
        
    } else if ([key isEqualToString:@"medium"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.mediumSizeImage = [WPImage instanceFromDictionary:value];
            self.mediumSizeImage.imageSize = WPImageSizeMedium;
            
        }
        
    } else if ([key isEqualToString:@"post-thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.postThumbnailSizeImage = [WPImage instanceFromDictionary:value];
            self.postThumbnailSizeImage.imageSize = WPImageSizePostThumbnail;
        }
        
    } else if ([key isEqualToString:@"thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnailSizeImage = [WPImage instanceFromDictionary:value];
            self.thumbnailSizeImage.imageSize = WPImageSizeThumbnail;
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"post-thumbnail"]) {
        [self setValue:value forKey:@"postThumbnailSizeImage"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}


- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.fullSizeImage) {
        [dictionary setObject:self.fullSizeImage forKey:@"fullSizeImage"];
    }
    
    if (self.mediumSizeImage) {
        [dictionary setObject:self.mediumSizeImage forKey:@"mediumSizeImage"];
    }
    
    if (self.postThumbnailSizeImage) {
        [dictionary setObject:self.postThumbnailSizeImage forKey:@"postThumbnailSizeImage"];
    }
    
    if (self.thumbnailSizeImage) {
        [dictionary setObject:self.thumbnailSizeImage forKey:@"thumbnailSizeImage"];
    }
    
    return dictionary;
    
}



@end

